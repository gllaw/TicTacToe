require_relative "tictactoe/version"
require_relative "./tictactoe/cell.rb"
require_relative "./tictactoe/player.rb"
require_relative "./tictactoe/board.rb"

module Tictactoe
  class Game

  	attr_reader :human
  	attr_accessor :board, :cpu, :currentPlayer, :waitingPlayer, :humanTaken

  	def initialize
  		@board = Board.new
  		@human = Player.new
  		@humanTaken = Array.new
  		@cpu = Player.new
  		@cpu.piece = "X"
  		if rand(1..2) == 1
  			@currentPlayer = @human
  			@waitingPlayer = @cpu
  		elsif rand(1..2) == 2
  			@currentPlayer = @cpu
  			@waitingPlayer = @human
  		end
  	end

  	def nextTurn
  		var = @currentPlayer
  		@currentPlayer = @waitingPlayer
  		@waitingPlayer = var
  	end

  	def putsBoard
	    puts "#{@board.getCell(0).piece}" + " | " + "#{@board.getCell(1).piece}" + " | " + "#{@board.getCell(2).piece}"
	    puts "---------"
	    puts "#{@board.getCell(3).piece}" + " | " + "#{@board.getCell(4).piece}" + " | " + "#{@board.getCell(5).piece}"
	    puts "---------"
	    puts "#{@board.getCell(6).piece}" + " | " + "#{@board.getCell(7).piece}" + " | " + "#{@board.getCell(8).piece}"
	  end

  	def play
  		puts "New game!" + "\n" + "POSITIONS DIAGRAM: "
	    puts " 0 | 1 | 2 "
	    puts "-----------"
	    puts " 3 | 4 | 5 "
	    puts "-----------"
	    puts " 6 | 7 | 8 "
  		9.times do
        if board.gameOver == :winner
          return "#{@currentPlayer.piece}s won."
        elsif board.gameOver == :tied
          return "Draw."
        end
  			if @currentPlayer == @human 
  				humanMove
  			# else
  			# 	cpuMove
  			end
        putsBoard
  			nextTurn
  		end
  	end

  	def humanMove
    	puts "Enter 0-8 to place your O piece:"
    	move = gets.chomp.to_i
    	if move.between?(0,8) && @board.getCell(move).piece == " "
	      # @humanTaken << move
	      @board.playPiece(move, @currentPlayer.piece)
	      # return
	    else
	      puts "Invalid, try again." + "\n" + "Enter 0-8 to place your O piece:"
	      humanMove
	    end
		end

		# def cpuMove
		# 	if @board.grid.all?{|cell| cell.piece == " "}
		# 		move = rand(0..8)
		# 		@board.playPiece(move,"X")
		# 	else
		# 		move = @board.findNonLosingMove
		# 		if @board.getCell(move).piece == " "
		# 			@board.playPiece(move,"X")
		# 			puts "Computer just placed an X in position #{move}."
		# 		else
		# 			puts "WHOOPS something broke. Restarting game."
	 #        play
	 #      end
		# 	end
		# end

  end
end
