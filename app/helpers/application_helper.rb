module ApplicationHelper

def title(page_title)
    content_for (:title) { page_title }
  end

  def yield_or_default(section, default = "")
    content_for?(section) ? content_for(section) : default
  end

 def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end
end

module UrlHelper
 
end