require './tasks/deploy'
require './tasks/audio'

desc "Deploy the static website in the build directory to Github pages"
task :deploy do
  GitHubPagesDeploy.new.run
end

desc "Buid the static website from the current source"
task :build do
  `bundle exec middleman build --clean`
end

desc "Process audio files (handle naming, tags, and artwork)"
task :process_audio do
  Dir.entries('./mixdowns').each do |filename|
    next unless filename.match(/^*\.mp3$/)
    audio = Audio.new(Dir.pwd + '/mixdowns/' + filename)

    # Rename the audio file to a standard format.
    audio.rename!
  end
end