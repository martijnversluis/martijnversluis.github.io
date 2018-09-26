class Section < Model
  attributes :title, :icon, :content
  has_many :cta_buttons, model: CtaButton

  def has_cta_buttons?
    cta_buttons.any?
  end

  def self.all
    multiple_from_yaml(data.sections)
  end
end
