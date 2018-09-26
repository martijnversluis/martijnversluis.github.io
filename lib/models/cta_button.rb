require_relative 'model'

class CtaButton < Model
  attributes :text, :url

  def full_url?
    url.match?(/^https?:\/\//)
  end
end
