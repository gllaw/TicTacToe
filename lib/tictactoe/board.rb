module Tictactoe
	class Board

		attr_reader :grid, :winPatterns
		attr_accessor :winner, :tied

		def initialize(input={})
			@grid = input.fetch(:grid, defaultGrid)
			@winPatterns = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		end

# ================== ACTIONS ======================
		def getCell(position)
			grid[position]
		end

		def playPiece(position,piece)
			getCell(position).piece=piece
		end

# ================== END GAME ====================
		def gameOver
			return :winner if winningGame?
			return :tied if tiedGame?
			false
		end

		def tiedGame?
	    @grid.each do |position|
	      if position.piece == " "
	        return false
	      end
	    end
	    puts "Tied game."
	    true
	  end

	  def winningGame?
	  	@winPatterns.each do |pattern|
	  		arr = Array.new
	  		pattern.each do |position|
	  			if getCell(position).piece == "X"
	  				arr.push("X")
	  			elsif getCell(position).piece == "O"
	  				arr.push("O")
	  			else
	  				arr.push(" ")
	  			end
	  		end
	  		if arr == ["X","X","X"]
	  			puts "Computer wins."
	  			return true
	  		elsif arr == ["O","O","O"]
	  			puts "Player wins. Oops."
	  			return true
	  		end
	  	end
	  	false
	  end

# ============ FOR FINDING CPU MOVE ==============
		def findNonLosingMove
			arrOfAvailable = Array.new
			@winPatterns.each do |pattern|
				if piecesInPattern(pattern, "X") == 2
					unless blankInPattern(pattern).empty?
	          var = blankInPattern(pattern).join.to_i
	          return var
	        else
	        	break
	        end
	      elsif piecesInPattern(pattern, "O") == 2
	      	if blankInPattern(pattern)
	          var = blankInPattern(pattern).join.to_i
	     			return var
	        else
	          break
	        end
	      elsif piecesInPattern(pattern, "X") == 1
	      	if noPlacedO(pattern)
	      		arrOfAvailable << blankInPattern(pattern)
	      		arrOfAvailable.flatten!
	     		else
	      		break
	      	end
	      elsif pattern.all? {|position| getCell(position).piece == " "}
	      	pattern.each do |position|
	          arrOfAvailable << position
	        end
	    	else #will be a tied game, just filling up the spaces
	    		@grid.each_index do |position|
	    			if getCell(position).piece == " "
	          	arrOfAvailable << position
	          end
	        end
	        var = arrOfAvailable.sample
	     		return var
	    	end
	    end
      if defined? var
	      return var
	    elsif arrOfAvailable.any?
	      return pickBestDupe(arrOfAvailable)
	    else
	      puts "Oh dear."
	    end
		end

		def piecesInPattern(pattern, piece)
	    total = 0
	    pattern.each do |position|
	      if getCell(position).piece == piece
	        total+=1
	      else
	        total+=0
	      end
	    end
	    return total
	  end

	  def blankInPattern(pattern)
	    arrOfBlanks = Array.new
	    pattern.each do |position|
	      arrOfBlanks.push(position) if getCell(position).piece == " "
	    end
	    return arrOfBlanks
	  end

	  def noPlacedO(pattern)
	  	pattern.each do |position|
	  		if @game.humanTaken.include?(position)
	  		# if getCell(position).piece == "O"
	  			return false
	  		else
	  			return true
	  		end
	  	end
	  end

	  def pickBestDupe(arr)
    	for i in (4).downto(1)
      	arr.select{|e| arr.count(e)>i}.uniq.sample.to_i if arr.select{|e| arr.count(e)>i}
      end
    end

		private
		def defaultGrid
			Array.new(9) {Cell.new}
		end

	end
end