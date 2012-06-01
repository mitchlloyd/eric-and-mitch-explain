require File.dirname(__FILE__) + '/data_source'

EPISODE_DIR = './source/episodes'

class Episode
  def initialize(resource)
    if resource.class.to_s == 'Middleman::Sitemap::Resource'
      @data = DataSource::Middleman.new(resource)
    else
      @data = DataSource::File.new(EPISODE_DIR + '/' + resource)
    end
  end

  def title
    @data.title or 'Untitled'
  end

  def episode_number
    @data.episode_number
  end

  def date
    (date = @data.date) ? date : Date.today()
  end

  def file
    @data.file
  end

  def file_size
    @data.file_size or ""
  end

  def body
    @data.body
  end

  def url
    @data.url
  end

  def self.get(path)
    # In the future we'll accept a path or an integer.
    episode_number = path.match(/\d{3}/)[0].to_i

    Dir.entries(EPISODE_DIR).each do |filename|
      return self.new(filename) if filename.match("%03d" % episode_number)
    end

    return false
  end
end