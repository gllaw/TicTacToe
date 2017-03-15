module Tictactoe
	class Player
		attr_reader :name
		attr_accessor :piece

		def initialize
			@piece = "O"
		end

	end
end