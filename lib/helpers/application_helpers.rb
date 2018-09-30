module ApplicationHelpers
  FILE_EXTENSION = /\.(\w+)$/

  def image_thumbnail(name, **attributes)
    link_to image_path(name), attributes.merge(target: '_blank') do
      image_tag "thumbnails/#{name}", alt: name
    end
  end

  def main_navigation_item(text, to:)
    content_tag :li, class: 'navigation__item' do
      current_link_to(text, to, { class: 'navigation__link' })
    end
  end

  def current_link_to(*arguments, aria_current: 'page', **options, &block)
    text, path = normalize_current_link_to_text_and_path(arguments, &block)
    link_options = options
    current_path = current_page.url.to_s.gsub(FILE_EXTENSION, '')

    if current_page.data.active_menu_item? && url_for(current_page.data.active_menu_item) == url_for(path)
      link_options['aria-current'] = aria_current
    elsif current_path == url_for(path)
      link_options['aria-current'] = aria_current
    end

    link_to(text, path, link_options)
  end

  def render_markdown(markdown)
    Kramdown::Document.new(markdown).to_html
  end

  def external_link(url)
    link_text = URI.parse(url).host
    link_to(link_text, url, target: '_blank')
  end

  private

  def normalize_current_link_to_text_and_path(arguments, &block)
    if block_given?
      text = capture(&block)
      path = arguments[0]
    else
      text = arguments[0]
      path = arguments[1]
    end

    [text, path]
  end
end
