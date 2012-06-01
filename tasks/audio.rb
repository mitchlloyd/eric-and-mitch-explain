require './extensions/episode'
TITLE_PREFIX = "Eric and Mitch Explain"
DESTINATION_DIR = './finalized_audio_files'

class Audio
  def initialize(file_path)
    @file_path = file_path
    raise "Couldn't find #{file_path}." unless File.exist?(@file_path)

    @episode = Episode.get(file_path)
  end

  def rename!
    File.rename(@file_path, "#{DESTINATION_DIR}/#{standard_episode_name}")
  end

  def standard_episode_name
    # Syntax for converting an integer to a string with padding zeros.
    episode_number_string = ("%03d" % @episode.episode_number)
    return "#{TITLE_PREFIX} - #{episode_number_string}.mp3"
  end
end