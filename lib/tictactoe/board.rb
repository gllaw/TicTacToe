module Tictactoe
	class Board

		attr_reader :grid, :win_patterns
		attr_accessor :winner, :tied

		def initialize(input = {})
			@grid = input.fetch(:grid, default_grid)
      $win_patterns = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		end

		def get_cell(position)
			grid[position.to_i]
		end

		def play_piece(position, piece)
			get_cell(position).piece = piece
		end

		def game_over
			return :winner if winning_game?
			return :tied if tied_game?
			false
		end

		def tied_game?
	    @grid.each do |position|
	      if position.piece == " "
	        return false
	      end
	    end
	    true
	  end

	  def winning_game?
	  	$win_patterns.each do |pattern|
	  		arr = Array.new
	  		pattern.each do |position|
	  			if get_cell(position).piece == "X"
	  				arr.push("X")
	  			elsif get_cell(position).piece == "O"
	  				arr.push("O")
	  			else
	  				arr.push(" ")
	  			end
	  		end
	  		if arr == ["X","X","X"] || arr == ["O","O","O"]
	  			return true
	  		end
	  	end
	  	false
	  end

		private
		def default_grid
			Array.new(9) {Cell.new}
		end

	end
end