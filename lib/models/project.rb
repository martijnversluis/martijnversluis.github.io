require_relative 'model'

class Project < Model
  attributes :company, :company_url, :start_year, :project, :technologies
end
