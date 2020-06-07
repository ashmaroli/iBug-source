# frozen_string_literal: true

module Jekyll
  class Page
    # For backwards-compatibility in subclasses that do not redefine
    # the `:to_liquid` method, stash existing definition under a new name
    #
    # TODO: Remove in Jekyll 5.0
    alias_method :legacy_to_liquid, :to_liquid
    private :legacy_to_liquid

    # Private
    # Subclasses can choose to optimize their `:to_liquid` method by wrapping
    # it around this definition.
    #
    # TODO: Remove in Jekyll 5.0
    def liquid_drop
      @liquid_drop ||= begin
        defaults = site.frontmatter_defaults.all(relative_path, type)
        unless defaults.empty?
          Utils.deep_merge_hashes!(data, Utils.deep_merge_hashes!(defaults, data))
        end
        Drops::PageDrop.new(self)
      end
    end
    private :liquid_drop

    # Public
    #
    # Liquid representation of current page
    #
    # TODO: Remove optional parameter in Jekyll 5.0
    def to_liquid(attrs = nil)
      self.class == Jekyll::Page ? liquid_drop : legacy_to_liquid(attrs)
    end
  end

  module Drops
    class PageDrop < Drop
      extend Forwardable

      mutable false

      def_delegators :@obj, :content, :dir, :name, :path, :url, :excerpt
      private def_delegator :@obj, :data, :fallback_data

      def title
        @obj.data["title"]
      end
    end
  end
end
