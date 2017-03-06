require "spec_helper.rb"

module Tictactoe
  describe Cell do
  	
  	describe "#initialize" do
      it "is initialized with a value of " " by default" do
        cell = Cell.new
        expect(cell.piece).to eq " "
      end
      it "can be initialized with a value of 'X'" do
  			cell = Cell.new("X")
  			expect(cell.piece).to eq "X"
			end
    end
  
  end
end