module ApplicationHelpers
  def render_markdown(markdown)
    Kramdown::Document.new(markdown).to_html
  end

  def external_link(url)
    link_text = URI.parse(url).host
    link_to(link_text, url, target: '_blank')
  end
end
