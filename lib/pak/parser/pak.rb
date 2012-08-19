module PAK

  module Parser

    class PAK < Base

      def self.can_parse?(io)
        Util::IO.peek(io, 4) == "PACK"
      end

      def initialize(io)
        raise Error::ParseError, "Unsupported input" unless self.class.can_parse?(io)

        @io = io
      end

      def parse!(&block)

        @io.seek(4)
        list_offset = @io.read(4).unpack("L!").first
        list_size = @io.read(4).unpack("L!").first

        entries = parse_directory_list!(list_offset, list_size)

        raise Error::ParseError unless list_size % 64 == 0

        entries.each do |path, offset, size|
          @io.seek(offset)
          block.call path, @io.read(size), size if block
        end 

      end

      protected
      def parse_directory_list!(offset, size)
        
        @io.seek(offset)

        list = []
        (size / 64).times do 
          list << parse_entry!
        end

        list
      end

      def parse_entry!
        entry = [@io.read(56), @io.read(4), @io.read(4)]
        raise Error::ParseError, "Unexpected EOF" if entry.any? { |e| e.nil? }

        path, offset, size = entry
        [path.unpack("Z*").first, offset.unpack("L!").first, size.unpack("L!").first]
      end

    end

  end

end