require 'date'

class Episode
  def initialize(resource)
    @resource = resource
  end

  def title
    @resource.data[:title] or 'Untitled'
  end

  # Episode paths look like this:
  #     episodes/001-business-travel.html
  #
  # This method will parse out a 1 from the example path.
  def episode_number
    filename = @resource.path.split('/').last
    filename.split('-').first.to_i
  end

  def date
    if date = @resource.data[:date]
      date
    else
      Date.today()
    end
  end

  def file
    @resource.data[:file]
  end

  def body
    @resource.render(layout: false)
  end

  def url
    @resource.url
  end
end