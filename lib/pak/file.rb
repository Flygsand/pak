module PAK

  class File

    attr_reader :path, :data, :size

    def initialize(attributes = {})
      @path = attributes.fetch(:path)
      @data = attributes.fetch(:data)
      @size = attributes.fetch(:size)
    end

  end

end