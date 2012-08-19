describe PAK::Parser::PAK do

  context "Invalid PAK file" do

    before do 
      @io = StringIO.new("BOGUS")
    end
    
    describe "#can_parse?" do

      it "should return false" do
        PAK::Parser::PAK.can_parse?(@io).should be_false
      end

    end

    describe "#parse!" do

      it "should raise a ParseError" do
        expect { PAK::Parser::PAK.new(@io).parse! }.to raise_error(PAK::Error::ParseError)
      end

    end
  end
end