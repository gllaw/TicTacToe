require "spec_helper.rb"

module Tictactoe
	describe Player do

		context "#initialize" do
			it "defaults players with the 'O' piece" do
				player = Player.new
				expect(player.piece).to eq "O"
			end
		end

		context "#piece" do
			it "can be overridden with a different value" do
				player = Player.new
				player.piece = "fish"
				expect(player.piece).to eq "fish"
			end
    end

	end
end