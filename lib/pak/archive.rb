require 'forwardable'

module PAK
  class Archive

    include Enumerable
    extend Forwardable

    def_delegators :@files, :each, :<<

    def self.open(filename)
      ::File.open(filename) do |io|
        archive = self.new
        ParserProxy.parse(io) do |path, data, size|
          archive << PAK::File.new(:path => path, :data => data, :size => size)
        end

        if block_given?
          yield archive
        else
          archive
        end
      end
    end

    protected 
    def initialize
      @files = []
    end

  end
end