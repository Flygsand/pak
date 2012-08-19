module PAK
  module Parser

    class Base

      def self.inherited(parser)
        ParserProxy.register_parser(parser)
      end

    end

  end
end