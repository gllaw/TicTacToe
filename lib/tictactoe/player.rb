module Tictactoe
	class Player
		attr_accessor :piece

		def initialize(piece = "O")
			@piece = piece
		end

	end
end