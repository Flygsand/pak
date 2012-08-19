module PAK
  module Util

    module IO

      def self.peek(io, length)
        oldpos = io.pos
        bytes = io.read(length)
        io.seek(oldpos)

        bytes
      end
    end
    
  end

end
