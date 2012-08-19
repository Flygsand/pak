module PAK

  class ParserProxy

    @parsers = []

    class << self

      attr_accessor :parsers

      def register_parser(parser)
        @parsers << parser
      end

      def parse(io, &block)
        parser = @parsers.find { |parser| parser.can_parse?(io) }

        raise Error::ParseError, "Unsupported or corrupt input" if parser.nil?

        parser.new(io).parse!(&block)
      end

    end
  end
end

glob = File.join(File.expand_path(File.dirname(__FILE__)), "parser", "*")

Dir.glob(glob).map { |f| File.basename(f, ".rb") }.each do |file|
  require "pak/parser/#{file}"
end
