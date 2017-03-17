module Tictactoe
	class Cell
		attr_accessor :piece

		def initialize(piece = " ")
			@piece = piece
		end

	end
end