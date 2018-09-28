module ApplicationHelpers
  def render_markdown(markdown)
    Kramdown::Document.new(markdown).to_html
  end
end
