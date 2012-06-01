module DataSource
  class File
    def initialize(resource)
      @path = resource

      ::File.open(@path) do |file|
        @content = file.read
        @yaml_data = parse_yaml_front_matter(@content)
        @file_size = file.size
      end
    end

    def title
      @yaml_data[:title]
    end

    # Episode paths should contain a 3 digit episode number like 009
    def episode_number
      ::File.basename(@path).match(/\d{3}/)[0].to_i
    end

    def date
      @yaml_data[:date]
    end

    # TODO: the interface needs to be changed so this isn't confusing.
    # Should be something like 'audio_url'
    def file
      @yaml_data[:file]
    end

    def file_size
      @file_size
    end

    def body
      @content
    end

    def url
      @path
    end


    private

    def parse_yaml_front_matter(content)
      yaml_regex = /\A(---\s*\n.*?\n?)^(---\s*$\n?)/m
      if content =~ yaml_regex
        content = content.sub(yaml_regex, "")

        begin
          data = YAML.load($1)
        rescue *YAML_ERRORS => e
          puts "YAML Exception: #{e.message}"
          return false
        end

      else
        return false
      end

      [data, content]
    rescue
      [{}, content]
    end
  end
end