# frozen_string_literal: true

class JekyllSEOTagShell < Liquid::Tag
  def render(_context)
    ""
  end
end

Liquid::Template.register_tag("seo", JekyllSEOTagShell)
