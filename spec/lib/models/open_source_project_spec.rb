load_dependency 'models', 'open_source_project'

RSpec.describe OpenSourceProject do
  it 'can initialize multiple projects from yaml' do
    yaml = [
      {
        'repository' => 'OpenSource',
        'screenshot' => 'oss.png',
        'package' => 'opensource',
        'description' => 'Open source project description'
      }
    ]

    open_source_project, _ = OpenSourceProject.multiple_from_yaml(yaml)
    expect(open_source_project.repository).to eq 'OpenSource'
    expect(open_source_project.screenshot).to eq 'oss.png'
    expect(open_source_project.package).to eq 'opensource'
    expect(open_source_project.description).to eq 'Open source project description'
  end

  it 'can initialize a single project from yaml' do
    yaml = {
      'repository' => 'OpenSource',
      'screenshot' => 'oss.png',
      'package' => 'opensource',
      'description' => 'Open source project description'
    }

    open_source_project = OpenSourceProject.from_yaml(yaml)
    expect(open_source_project.repository).to eq 'OpenSource'
    expect(open_source_project.screenshot).to eq 'oss.png'
    expect(open_source_project.package).to eq 'opensource'
    expect(open_source_project.description).to eq 'Open source project description'
  end

  describe '#has_package?' do
    context 'when the open source project has a package' do
      it 'returns true' do
        yaml = {
          'repository' => 'OpenSource',
          'screenshot' => 'oss.png',
          'package' => 'opensource',
          'description' => 'Open source project description'
        }

        open_source_project = OpenSourceProject.from_yaml(yaml)
        expect(open_source_project).to have_package
      end
    end

    context 'when the open source project has no package' do
      it 'returns true' do
        yaml = {
          'repository' => 'OpenSource',
          'screenshot' => 'oss.png',
          'package' => '',
          'description' => 'Open source project description'
        }

        open_source_project = OpenSourceProject.from_yaml(yaml)
        expect(open_source_project).not_to have_package
      end
    end
  end

  describe '#has_screenshot?' do
    context 'when the open source project has a screenshot' do
      it 'returns true' do
        yaml = {
          'repository' => 'OpenSource',
          'screenshot' => 'oss.png',
          'package' => 'opensource',
          'description' => 'Open source project description'
        }

        open_source_project = OpenSourceProject.from_yaml(yaml)
        expect(open_source_project).to have_screenshot
      end
    end

    context 'when the open source project has no screenshot' do
      it 'returns true' do
        yaml = {
          'repository' => 'OpenSource',
          'screenshot' => '',
          'package' => 'opensource',
          'description' => 'Open source project description'
        }

        open_source_project = OpenSourceProject.from_yaml(yaml)
        expect(open_source_project).not_to have_screenshot
      end
    end
  end
end
