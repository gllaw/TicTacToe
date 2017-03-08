require "spec_helper.rb"

module Tictactoe
  describe Cell do
  	
  	describe "#initialize" do
      it "is initialized with a " " piece by default" do
        cell = Cell.new
        expect(cell.piece).to eq " "
      end

      it "can be overridden with another piece" do
        cell = Cell.new
        cell.piece = "X"
        expect(cell.piece).to eq "X"
      end
    end
  
  end
end