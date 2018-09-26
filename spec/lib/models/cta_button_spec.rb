load_dependency 'models', 'cta_button'

RSpec.describe CtaButton do
  it 'can initialize multiple cta buttons from yaml' do
    yaml = [
      {
        'text' => 'CTA text',
        'url' => 'CTA url'
      }
    ]

    cta_buttons = CtaButton.multiple_from_yaml(yaml)

    expect(cta_buttons.first.text).to eq 'CTA text'
    expect(cta_buttons.first.url).to eq 'CTA url'
  end

  it 'can initialize a single section from yaml' do
    cta_button = CtaButton.from_yaml({
      'text' => 'CTA text',
      'url' => 'CTA url'
    })

    expect(cta_button.text).to eq 'CTA text'
    expect(cta_button.url).to eq 'CTA url'
  end
end
