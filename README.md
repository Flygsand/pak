# PAK

PAK is a Ruby library for reading Quake PAK files. Currently it's in a very rough state.

## Installation

Add this line to your application's Gemfile:

    gem 'pak'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pak

## Usage

    require 'pak'

    PAK::Archive.open('/path/to/file.pak') do |pak|

    	pak.each do |file|

    		puts file.path

    	end

    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
