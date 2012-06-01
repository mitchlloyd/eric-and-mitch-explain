module DataSource
  class Middleman
    def initialize(resource)
      @resource = resource
    end

    def title
      @resource.data[:title]
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
      @resource.data[:date]
    end

    def file
      @resource.data[:file]
    end

    def file_size
      @resource.data[:file_size]
    end

    def body
      @resource.render(layout: false)
    end

    def url
      @resource.url
    end
  end
end