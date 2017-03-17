require "spec_helper.rb"

module Tictactoe
	describe Computer do

		context "#initialize" do
			it "initializes computer with the 'X' piece" do
				cpu = Computer.new
				expect(cpu.piece).to eq "X"
			end
		end

		context "#piece" do
			it "can be overridden with a different value" do
				cpu = Computer.new
				cpu.piece = "eel"
				expect(cpu.piece).to eq "eel"
			end
    end

    TestCell = Struct.new(:piece)
    let(:x_cell){TestCell.new("X")}
    let(:o_cell){TestCell.new("O")}
    let(:blank_cell){TestCell.new(" ")}

# =========================== HELPERS =============================
    context "#pieces_in_pattern" do
      it "counts the number of a given piece already in a win_pattern" do
        cpu = Computer.new
        grid = [x_cell, blank_cell, blank_cell, blank_cell, blank_cell, blank_cell, blank_cell, blank_cell, x_cell,]
        $board = Board.new(grid: grid)
        expect(cpu.pieces_in_pattern([0,4,8], "X")).to eq 2
      end
    end

    context "#blank_in_pattern" do
      it "returns the last blank of a win pattern in an array" do
        cpu = Computer.new
        grid = [x_cell, blank_cell, blank_cell, blank_cell, blank_cell, blank_cell, blank_cell, blank_cell, x_cell,]
        $board = Board.new(grid: grid)
        expect(cpu.blank_in_pattern([0,4,8])).to eq [4] 
      end
    end

    context "#no_placed_O" do
      it "returns false if there's an O in the pattern" do
        cpu = Computer.new
        grid = [x_cell, o_cell, blank_cell, blank_cell, o_cell, blank_cell, blank_cell, x_cell, blank_cell]
        $board = Board.new(grid: grid)
        expect(cpu.no_placed_O([0,1,2])).to eq false
      end
      it "returns true if there's no Os in the pattern" do
        cpu = Computer.new
        grid = [x_cell, o_cell, blank_cell, blank_cell, o_cell, blank_cell, blank_cell, x_cell, blank_cell]
        $board = Board.new(grid: grid)
        expect(cpu.no_placed_O([0,3,6])).to eq true
      end
    end
    
    context "#pick_best_dupe" do
      it "takes in an array of duplicated integers and returns a random one of the ones that had the most duplicates" do
        cpu = Computer.new
        arr = [3,6,6,8]
        expect(cpu.pick_best_dupe(arr)).to eq 6
      end
    end
# ========================== SEPARATED OUT ========================
    context "#find_last_X" do
      it "determines that a pattern has two Xs already and returns the last blank position" do
        cpu = Computer.new
        grid = [x_cell, blank_cell, blank_cell, blank_cell, blank_cell, blank_cell, blank_cell, blank_cell, x_cell]
        $board = Board.new(grid: grid)
        expect(cpu.find_last_X([0,4,8])).to eq 4
      end
    end

    context "#find_last_O" do
      it "determines that a pattern has two Os already and returns the last blank position" do
        cpu = Computer.new
        grid = [blank_cell, o_cell, o_cell, blank_cell, blank_cell, blank_cell, blank_cell, blank_cell, blank_cell]
        $board = Board.new(grid: grid)
        cpu.pieces_in_pattern([0,1,2], "O") == 2
        cpu.blank_in_pattern([0,1,2]) == [0]
        expect(cpu.find_last_O([0,1,2])).to eq 0
      end
    end
    
    context "#find_started_pattern" do
      it "determines if a pattern has already been started by X but not intruded on by any Os and returns arr_of_available blank[s]" do
        cpu = Computer.new
        grid = [x_cell, o_cell, blank_cell, blank_cell, o_cell, blank_cell, blank_cell, x_cell, blank_cell]
        $board = Board.new(grid: grid)
        cpu.pieces_in_pattern([0,1,2], "X") == 1
        cpu.no_placed_O([0,1,2]) == false
        expect(cpu.find_started_pattern([0,1,2])).to eq false
      end
      it "determines if a pattern has already been started by X but not intruded on by any Os and returns arr_of_available blank[s]" do
        cpu = Computer.new
        grid = [x_cell, o_cell, blank_cell, blank_cell, o_cell, blank_cell, blank_cell, x_cell, blank_cell]
        $board = Board.new(grid: grid)
        cpu.pieces_in_pattern([0,3,6], "X") == 1
        cpu.no_placed_O([0,3,6]) == true
        expect(cpu.find_started_pattern([0,3,6])).to eq [3,6]
      end
    end
    
    context "#find_empty_pattern" do
      it ""
    end

# ========================= THE ALBATROSS ===========================
    # context "#find_non_losing_move" do
    #   it "returns an integer" do
#bc it's really up-in-the-air whether "return" will push forward the unspoke var to be useful in game.play .
    #   end

    #   it "returns an integer from the remaining blank spaces of an inevitably tied game" do
    #   end
    # end
#how to test if it's actually running thru all the win_patterns the way you want it to?

	end
end