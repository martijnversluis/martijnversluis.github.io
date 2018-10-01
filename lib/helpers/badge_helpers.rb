module BadgeHelpers
  def github_link(open_source_project, **attributes)
    link_to(
      "View #{open_source_project.repository} on GitHub",
      "https://www.github.com/martijnversluis/#{open_source_project.repository}",
      target: '_blank',
      **attributes
    )
  end

  def code_climate_badge(open_source_project)
    badge url: "https://codeclimate.com/github/martijnversluis/#{open_source_project.repository}",
          image: "https://codeclimate.com/github/martijnversluis/#{open_source_project.repository}/badges/gpa.svg",
          alt: "Code Climate maintainability score"
  end

  def travis_status_badge(open_source_project)
    badge url: "https://travis-ci.org/martijnversluis/#{open_source_project.repository}",
          image: "https://travis-ci.org/martijnversluis/#{open_source_project.repository}.svg?branch=master",
          alt: "Travis build status"
  end

  def npm_badge(open_source_project)
    badge url: "https://www.npmjs.com/package/#{open_source_project.package}",
          image: "https://badge.fury.io/js/#{open_source_project.package}.svg",
          alt: "NPM version"
  end

  private

  def badge(url:, image:, alt:)
    link_to(url, target: '_blank') do
      image_tag(image, alt: alt)
    end
  end
end
