require './tasks/deploy'

desc "Deploy the static website in the build directory to Github pages"
task :deploy do
  GitHubPagesDeploy.new.run
end

desc "Buid the static website from the current source"
task :build do
  `bundle exec middleman build --clean`
end