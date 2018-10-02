module ApplicationHelpers
  FILE_EXTENSION = /\.(\w+)$/
  DIST_PATH = File.join(Dir.pwd, 'build')
  REV_MANIFEST_PATH = File.join(DIST_PATH, 'rev-manifest.json')

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

  def webpack_asset_path(path)
    return "webpack_build_disabled_in_tests" if config[:environment] == :test
    rev_manifest = JSON.parse(File.read(REV_MANIFEST_PATH)) if File.exist?(REV_MANIFEST_PATH)
    raise "#{REV_MANIFEST_PATH} is missing." unless rev_manifest

    asset_path = rev_manifest[path]
    raise "Can't find #{path} in webpack assets. See rev-manifest.json for complete list." unless asset_path
    File.absolute_path(asset_path, '/')
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
