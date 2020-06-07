source "https://rubygems.org"

if ENV["JEKYLL_UPSTREAM"]
  gem "jekyll", github: "master"
elsif ENV["JEKYLL_VERSION"]
  gem "jekyll", ENV["JEKYLL_VERSION"]
else
  gem "jekyll"
end

gem "minimal-mistakes-jekyll", '>= 4.19.3'
gem "liquid-c", '~> 4.0'

# Required for LSI, too slow however
if ENV['LSI'] == 'true'
  gem "classifier-reborn"
  gem "gsl"
end

group :jekyll_plugins do
  # Class 1: Default plugins on GitHub Pages
  #gem "jekyll-gist"
  gem "jekyll-sitemap"
  #gem "jekyll-paginate"
  gem "jekyll-feed"
  #gem "jemoji"
  gem "jekyll-relative-links"
  gem "jekyll-optional-front-matter"
  #gem "jekyll-readme-index"
  #gem "jekyll-default-layout"
  #gem "jekyll-titles-from-headings"
  gem "jekyll-github-metadata" if ENV['CI'] == 'true'

  # Class 2: Optional plugins on GitHub Pages
  gem "jekyll-redirect-from"
  gem "jekyll-mentions"
  gem "jekyll-seo-tag"
  #gem "jekyll-coffeescript"
  gem "jekyll-include-cache"

  # Class 3: Extras
  gem "jekyll-environment-variables"
  gem "jekyll-tidy"
  gem "jekyll-last-modified"
  # gem "jekyll-assets"
  gem "jekyll-algolia"
  gem "jekyll-archives", '>= 2.2.1'
  gem "jekyll-paginate-v2", '>= 3.0.0'
end

platforms :mingw, :x64_mingw, :mswin do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
  gem "wdm", "~> 0.1.1"
end

gem "memory_profiler"
