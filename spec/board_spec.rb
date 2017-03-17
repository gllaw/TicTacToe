require "spec_helper.rb"
 
module Tictactoe
  describe Board do
 
    context "#initialize" do
    	it "initializes the board with a grid" do
        expect { Board.new(grid: "grid") }.to_not raise_error
      end
      it "initializes the board to be a 9-element array" do
  			board = Board.new
  			expect(board.grid.length).to eq(9)
			end
			it "creates blanks in each cell by default" do
  			board = Board.new
  			board.grid.each do |cell|
    			expect(cell.piece).to eq " "
  			end
			end
    end

    context "#grid" do
		  it "returns the grid" do
		    board = Board.new(grid: "blah")
		    expect(board.grid).to eq "blah"
		  end
		end

		context "#win_patterns" do
		  it "returns the win_patterns as arrays inside an array" do
		    board = Board.new
		    expect($win_patterns).to eq([[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]])
		  end
		end
 
 		context "#get_cell" do
		  it "returns the cell based on the position" do
		    grid = [" "," "," "," ","X"," "," "," "," "]
		    board = Board.new(grid: grid)
		    expect(board.get_cell(4)).to eq "X"
		  end
		end

		context "#play_piece" do
		  it "sets the value of the cell at position given" do
		    TestCell = Struct.new(:piece)
		    grid = [" ", " ", " ", " ", TestCell.new("something"), " ", " ", " ", " ", " "]
		    board = Board.new(grid: grid)
		    board.play_piece(4, "O")
		    expect(board.get_cell(4).piece).to eq "O"
		  end
		end

		context "#game_over" do
		  it "returns :winner if winning_game? is true" do
		    board = Board.new
		    board.stub(:winning_game?){true}
		    expect(board.game_over).to eq :winner
		  end
		  it "returns :tied if winning_game? is false and tied_game? is true" do
		    board = Board.new
		    board.stub(:winning_game?){false}
		    board.stub(:tied_game?){true}
		    expect(board.game_over).to eq :tied
		  end
		  it "returns false if winning_game? is false and tied_game? is false" do
		    board = Board.new
		    board.stub(:winning_game?){false}
		    board.stub(:tied_game?){false}
		    expect(board.game_over).to be false
		  end
		end

		context "#tied_game?" do
			it "returns false if grid contains a blank" do
				TestCell = Struct.new(:piece)
		  	grid = [TestCell.new(" "), TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new(" "), TestCell.new(" "), TestCell.new("something"), TestCell.new("something")]
		  	board = Board.new(grid: grid)
		    expect(board.tied_game?).to be false
		  end
		  it "returns true if grid does not contain a blank piece" do
		  	TestCell = Struct.new(:piece)
		  	grid = [TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new("something")]
		  	board = Board.new(grid: grid)
		    expect(board.tied_game?).to be true
		  end
		end

		context "#winning_game?" do
			it "returns false if no win_pattern filled" do
				TestCell = Struct.new(:piece)
				grid = [TestCell.new("X"),TestCell.new("O"),TestCell.new("X"),TestCell.new("X"),TestCell.new("O"),TestCell.new("O"),TestCell.new("O"),TestCell.new("X"),TestCell.new("X")]
				board = Board.new(grid: grid)
				expect(board.winning_game?).to be false
			end
			it "returns true if a win_pattern is filled by all Xs" do
				TestCell = Struct.new(:piece)
				grid = [TestCell.new("X"),TestCell.new("O"),TestCell.new(" "),TestCell.new(" "),TestCell.new("X"),TestCell.new(" "),TestCell.new(" "),TestCell.new("O"),TestCell.new("X")]
				board = Board.new(grid: grid)
				expect(board.winning_game?).to be true
			end
		end

		TestCell = Struct.new(:piece)
		let(:x_cell){TestCell.new("X")}
		let(:o_cell){TestCell.new("O")}
		let(:blank_cell){TestCell.new(" ")}

		context "#game_over" do
			it "returns :winner when a win_pattern is filled by all Os" do
				grid = [o_cell, o_cell, o_cell, blank_cell, blank_cell, blank_cell, blank_cell, blank_cell, blank_cell]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq :winner
			end
			it "returns :winner when a win_pattern is filled by all Xs" do
				grid = [x_cell, blank_cell, blank_cell, blank_cell, x_cell, blank_cell, blank_cell, blank_cell, x_cell,]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq :winner
			end
			it "returns false when a win_pattern is filled by all blanks" do
				grid = [x_cell, o_cell, blank_cell, o_cell, x_cell, blank_cell, x_cell, o_cell, blank_cell,]
				board = Board.new(grid: grid)
				expect(board.game_over).to be false
			end
			it "returns :tied when there are no blanks left on the board" do
				grid = [x_cell,o_cell,x_cell,x_cell,o_cell,o_cell,o_cell,x_cell,x_cell]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq :tied
			end
			it "returns false when there's no winner yet nor is the game a tie" do
				grid = [x_cell, o_cell, o_cell, o_cell, x_cell, o_cell, x_cell, o_cell, blank_cell,]
				board = Board.new(grid: grid)
				expect(board.game_over).to be false 
			end
		end

  end
end










