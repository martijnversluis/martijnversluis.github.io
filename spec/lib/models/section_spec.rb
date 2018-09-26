load_dependency 'models', 'section'

RSpec.describe Section do
  it 'can initialize multiple sections from yaml' do
    yaml = [
      {
        'title' => 'First section',
        'icon' => 'first',
        'content' => 'This is the first section',

        'cta_buttons' => [
          {
            'text' => 'CTA text',
            'url' => 'CTA url'
          }
        ]
      },

      {
        'title' => 'Second section',
        'icon' => 'second',
        'content' => 'This is the second section'
      }
    ]

    first_section, second_section = Section.multiple_from_yaml(yaml)

    expect(first_section.title).to eq 'First section'
    expect(first_section.icon).to eq 'first'
    expect(first_section.content).to eq 'This is the first section'

    expect(first_section.cta_buttons.first.text).to eq 'CTA text'
    expect(first_section.cta_buttons.first.url).to eq 'CTA url'

    expect(second_section.title).to eq 'Second section'
    expect(second_section.icon).to eq 'second'
    expect(second_section.content).to eq 'This is the second section'
  end

  it 'can initialize a single section from yaml' do
    section = Section.from_yaml({
      'title' => 'First section',
      'icon' => 'first',
      'content' => 'This is the first section'
    })

    expect(section.title).to eq 'First section'
    expect(section.icon).to eq 'first'
    expect(section.content).to eq 'This is the first section'
    expect(section.cta_buttons).to eq []
  end
end
