# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/admin/*", layout: false


# Stylesheet Directories
set :js_dir, 'assets/js'
set :css_dir, 'assets/css'
set :images_dir, 'assets/img'

# Pretty URLs
activate :directory_indexes

page "404.html", :directory_index => false


# Blog
activate :blog do |blog|
  blog.name = "articles"
  blog.permalink = ":title"
  blog.sources = "articles/{year}-{month}-{day}-:title.html"
  blog.default_extension = ".md"
  blog.layout = "article"
  blog.paginate = false
end

# Talks
activate :blog do |blog|
  blog.name = "talks"
  blog.permalink = "talks/:title"
  blog.sources = "talks/:title.html"
  blog.default_extension = ".md"
  blog.layout = "page"
  blog.paginate = false
end

# Series
activate :blog do |blog|
  blog.name = "series"
  blog.permalink = "series/:series/:title"
  blog.sources = "series/:series-:title.html"
  blog.default_extension = ".md"
  blog.layout = "series/post"
  blog.paginate = false
end

# Redirect
redirect "series/index.html", to: "series/slack"


# Template
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# Used for generating absolute URLs
set :site, "https://thomas.codes"

# Build
configure :build do
  activate :minify_css
  activate :minify_html

  activate :gzip
end

# Helpers
require "lib/marketing_helpers"
helpers MarketingHelpers



