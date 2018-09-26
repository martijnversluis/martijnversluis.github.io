require 'pathname'

def load_dependency(*path)
  require Pathname.new(__dir__).join('..', '..', 'lib', *path).to_s
end
