require 'rspec/core/rake_task'

task test: :spec

task :build do
  puts 'Building project'
  exec_fail_fast 'middleman build'
end

task :deploy do
  puts 'Deploying to GitHub'
  exec_fail_fast 'middleman deploy'
end

def exec_fail_fast(command)
  system(command)
  raise "Command: `#{command}` exited with code #{$?.exitstatus}" unless $? == 0
end
