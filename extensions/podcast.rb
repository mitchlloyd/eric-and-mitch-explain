require (File.dirname(__FILE__) + '/episode')

module Podcast
  class << self
    def registered(app)
      app.helpers Helpers
    end
    alias :included :registered
  end

  module Helpers
    def podcast_episodes
      podcast_data.episodes
    end

    private

    def podcast_data
      @_podcast_data ||= PodcastData.new(self)
    end
  end
end

class PodcastData
  def initialize(app)
    @app = app
    @episode_dir = Dir.new('./source/episodes')
  end

  def episodes
    episode_resources = @app.sitemap.resources.select do |resource|
      resource.path.match(/episodes\//)
    end

    episode_resources.map {|resource| Episode.new(resource)}
  end
end

::Middleman::Extensions.register(:podcast, Podcast)