require_relative 'model'

class OpenSourceProject < Model
  attributes :repository, :screenshot, :package, :description

  def has_package?
    !(package.nil? || package.empty?)
  end

  def has_screenshot?
    !(screenshot.nil? || screenshot.empty?)
  end
end
