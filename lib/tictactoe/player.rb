module Tictactoe
	class Player
		attr_reader :name
		attr_accessor :piece

		def initialize#(input)
			# @name = input.fetch(:name).chomp
			@piece = "O"
		end

	end
end