---
layout: false
blog: articles
---

root_url = "http://thomas.codes"
feed_url = URI.join(root_url, current_page.path)

xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title ["Thomas McGoey-Smith"].compact.join(" - ")
  xml.subtitle ["thomas.codes"].compact.join(" ")
  xml.link "href" => feed_url, "rel" => "self"
  xml.updated(blog.articles.first.date.to_time.iso8601) unless blog.articles.empty?
  xml.author { xml.name "Thomas McGoey-Smith" }

  blog.articles.each do |article|
    article_url = URI.join(root_url, article.url)
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article_url
      xml.id article_url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "Thomas McGoey-Smith" }
      xml.summary article.summary(500), :type => "html"
      xml.content article.body, "type" => "html"
    end
  end
end