require_relative "./tictactoe/cell.rb"
require_relative "./tictactoe/player.rb"
require_relative "./tictactoe/board.rb"
require_relative "./tictactoe/computer.rb"

module Tictactoe
  class Game

  	attr_accessor :board, :cpu, :human, :current_player, :waiting_player

  	def initialize
  		$board = Board.new
  		$human = Player.new
  		$cpu = Computer.new
  		if rand(1..2) == 1
  			@current_player = $human
  			@waiting_player = $cpu
  		elsif rand(1..2) == 2
  			@current_player = $cpu
  			@waiting_player = $human
  		end
  	end

  	def next_turn
  		var = @current_player
  		@current_player = @waiting_player
  		@waiting_player = var
  	end

  	def puts_board
	    puts "#{$board.get_cell(0).piece}" + " | " + "#{$board.get_cell(1).piece}" + " | " + "#{$board.get_cell(2).piece}"
	    puts "---------"
	    puts "#{$board.get_cell(3).piece}" + " | " + "#{$board.get_cell(4).piece}" + " | " + "#{$board.get_cell(5).piece}"
	    puts "---------"
	    puts "#{$board.get_cell(6).piece}" + " | " + "#{$board.get_cell(7).piece}" + " | " + "#{$board.get_cell(8).piece}"
	  end

  	def play
  		puts "LET'S PLAY TIC TAC TOE!" + "\n" + "Positions diagram: "
	    puts " 0 | 1 | 2 "
	    puts "-----------"
	    puts " 3 | 4 | 5 "
	    puts "-----------"
	    puts " 6 | 7 | 8 "
      puts "New game: "
      9.times do
  			if $board.game_over == :winner
          return "#{@current_player.piece}s won."
        elsif $board.game_over == :tied
          return "Game ended in a tie."
        end
        next_turn
        if @current_player == $human && @waiting_player == $cpu
  				human_move
  			elsif @current_player == $cpu && @waiting_player == $human
  				cpu_move
        end
        puts_board
  		end
  	end

  	def human_move
    	puts "Enter 0-8 to place your O piece:"
    	move = gets.chomp.to_i
    	if move.between?(0,8) && $board.get_cell(move).piece == " "
	      $board.play_piece(move, @current_player.piece)
        return
	    else
	      puts "Invalid, try again." + "\n" + "Enter 0-8 to place your O piece:"
	      human_move
	    end
		end

		def cpu_move
    #   total = 0
    #   $board.grid.each do |cell|
    #     if cell.piece == " "
    #       total+=1
    #     end
    #   end
    #   if total == 9
    #     move = rand(0..8)
    #   else
    #     move = $cpu.find_non_losing_move
    #   end
    #   $board.play_piece(move, "X")
    # end
      

      if $board.grid.all?{|cell| cell.piece == " "}
				move = rand(0..8)
				$board.play_piece(move, @current_player.piece)
        puts "Computer went first: "
			else
				move = $cpu.find_non_losing_move
				if $board.get_cell(move).piece == " "
					$board.play_piece(move, @current_player.piece)
					puts "Computer just placed an X in position #{move}."
				else
					puts "WHOOPS something broke. Restarting game."
	        play
	      end
			end
      return
		end

  end
end
