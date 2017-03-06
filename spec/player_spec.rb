require "spec_helper.rb"

module Tictactoe
	describe Player do

		# context "#initialize" do
		# 	it "raises an exception when initialized without input" do
		# 		expect{Player.new}.to raise_error
		# 	end
		# 	it "does not raise an error when initialized with input" do
  # 			input = {name: "Beatrice"}
  # 			expect{Player.new(input)}.to_not raise_error
		# 	end
		# end

		# context "#name" do
  # 		it "returns the player's name" do
  #   		input = {name: "Betty"}
  #   		player = Player.new(input)
  #   		expect(player.name).to eq "Betty"
  # 		end
		# end

		context "#piece" do
			it "returns the player's piece" do
  			# input = {name: "Bertrand"}
				player = Player.new#(input)
    		expect(player.piece).to eq "O"
    	end
    end

	end
end