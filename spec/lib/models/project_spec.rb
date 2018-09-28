load_dependency 'models', 'project'

RSpec.describe Project do
  it 'can initialize multiple projects from yaml' do
    yaml = [
      {
        'company' => 'Kabisa',
        'company_url' => 'https://www.kabisa.nl',
        'start_year' => 2017,
        'project' => 'Several projects',
        'technologies' => [
          'Ruby',
          'JavaScript',
          'Ruby on Rails',
          'Spree',
          'GraphQL',
          'React',
          'Middleman',
          'Grape'
        ]
      }
    ]

    project, _ = Project.multiple_from_yaml(yaml)
    expect(project.company).to eq 'Kabisa'
    expect(project.company_url).to eq 'https://www.kabisa.nl'
    expect(project.start_year).to eq 2017
    expect(project.project).to eq 'Several projects'
    expect(project.technologies).to eq [
      'Ruby',
      'JavaScript',
      'Ruby on Rails',
      'Spree',
      'GraphQL',
      'React',
      'Middleman',
      'Grape'
    ]
  end

  it 'can initialize a single project from yaml' do
    yaml = {
      'company' => 'Kabisa',
      'company_url' => 'https://www.kabisa.nl',
      'start_year' => 2017,
      'project' => 'Several projects',
      'technologies' => [
        'Ruby',
        'JavaScript',
        'Ruby on Rails',
        'Spree',
        'GraphQL',
        'React',
        'Middleman',
        'Grape'
      ]
    }


    project = Project.from_yaml(yaml)
    expect(project.company).to eq 'Kabisa'
    expect(project.company_url).to eq 'https://www.kabisa.nl'
    expect(project.start_year).to eq 2017
    expect(project.project).to eq 'Several projects'
    expect(project.technologies).to eq [
      'Ruby',
      'JavaScript',
      'Ruby on Rails',
      'Spree',
      'GraphQL',
      'React',
      'Middleman',
      'Grape'
    ]
  end
end
