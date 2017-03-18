require "spec_helper.rb"

module Tictactoe
  describe Game do

    context "#next_turn" do
    	it "sets the current_player to waiting_player to swap turns" do
    		game = Game.new
    		waiting_player = game.waiting_player
    		game.next_turn
    		expect(game.current_player).to eq waiting_player
    	end
    	it "also sets waiting_player to current_player" do
    		game = Game.new
    		current_player = game.current_player
    		game.next_turn
    		expect(game.waiting_player).to eq current_player
    	end
    end

    context "#play" do
      it "puts a message if it detects a human winner" do
        game = Game.new
        $board.stub(:game_over){:winner}
        game.current_player = $human
        game.waiting_player = $cpu
        expect(game.play).to eq "Os won."
         
      end
      it "puts a message if it detects a cpu winner" do
        game = Game.new
        $board.stub(:game_over){:winner}
        game.current_player = $cpu
        game.waiting_player = $human
        expect(game.play).to eq "Xs won."
      end
      it "puts a message if it detects a tie" do
        game = Game.new
        # game.stub(:current_player){$human}
        $board.stub(:game_over){:tied}
        expect(game.play).to eq "Game ended in a tie."
      end
    end

  end
end