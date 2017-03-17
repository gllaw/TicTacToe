require "spec_helper.rb"

module Tictactoe
  describe Cell do
  	
  	describe "#initialize" do
      it "is initialized with a " " piece by default" do
        cell = Cell.new
        expect(cell.piece).to eq " "
      end

      it "can be overridden with another value for piece" do
        cell = Cell.new
        cell.piece = "turtle"
        expect(cell.piece).to eq "turtle"
      end
    end
  
  end
end