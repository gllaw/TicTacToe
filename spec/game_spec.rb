require "spec_helper.rb"

module Tictactoe
  describe Game do

  	# context "#initialize" do
   #    it "randomly assigns a currentPlayer" do
   #      game = Game.new
   #      expect(game.currentPlayer).to eq game.human
   #    end
 
   #    it "randomly assigns a waitingPlayer" do
   #      game = Game.new
   #      expect(game.waitingPlayer).to eq game.cpu
   #    end
   #  end

    context "#nextTurn" do
    	it "sets the currentPlayer to waitingPlayer to swap turns" do
    		game = Game.new
    		waitingPlayer = game.waitingPlayer
    		game.nextTurn
    		expect(game.currentPlayer).to eq waitingPlayer
    	end
    	it "also sets waitingPlayer to currentPlayer" do
    		game = Game.new
    		currentPlayer = game.currentPlayer
    		game.nextTurn
    		expect(game.waitingPlayer).to eq currentPlayer
    	end
    end

    context "#play" do
    	it "puts a message if it detects a winner" do
    		game = Game.new
    		game.stub(:currentPlayer){game.human}
    		game.board.stub(:gameOver){:winner}
    		expect(game.play).to eq "Os won."
    	end
    	it "puts a message if it detects a tie" do
    		game = Game.new
    		game.stub(:currentPlayer){game.human}
    		game.board.stub(:gameOver){:tied}
    		expect(game.play).to eq "Draw."
    	end
    end

    # context "#humanMove" do
    #   before do 
    #     $var = String.new("5")
    #   end
    # 	it "gets the move and checks that it is a valid selection" do
    # 		game = Game.new
    #     grid = [" "," "," "," "," "," "," "," "," "]
    #     game.board = Board.new(grid: grid)
    #     currentPlayer = @human
    # 		# move = $var.chomp.to_i
    #     game.humanMove
    # 		expect(game.humanMove).to eq [" "," "," "," "," ","O"," "," "," "]
    #     # "humanTaken: [5]"
    # 	end
    # end

    context "#cpuMove" do
      it "places the X piece on the board" do
        TestCell = Struct.new(:piece)
        grid = [TestCell.new(" "),TestCell.new(" "),TestCell.new(" "),TestCell.new(" "),TestCell.new(" "),TestCell.new(" "),TestCell.new(" "),TestCell.new(" "),TestCell.new(" ")]
        game = Game.new
        game.board = Board.new(grid: grid)
        currentPlayer = Player.new
        currentPlayer.piece = "X"
        move = 3
        game.board.stub(move,currentPlayer.piece)
        expect(game.cpuMove).to eq [TestCell.new(" "),TestCell.new(" "),TestCell.new(" "),TestCell.new("X"),TestCell.new(" "),TestCell.new(" "),TestCell.new(" "),TestCell.new(" "),TestCell.new(" ")]
      end
    end

  end
end