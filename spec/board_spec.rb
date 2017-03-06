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
 
 		context "#getCell" do
		  it "returns the cell based on the position" do
		    grid = [" "," "," "," ","X"," "," "," "," "]
		    board = Board.new(grid: grid)
		    expect(board.getCell(4)).to eq "X"
		  end
		end

		context "#playPiece" do
		  it "sets the value of the cell at position given" do
		    TestCell = Struct.new(:piece)
		    grid = [" ", " ", " ", " ", TestCell.new("something"), " ", " ", " ", " ", " "]
		    board = Board.new(grid: grid)
		    board.playPiece(4, "O")
		    expect(board.getCell(4).piece).to eq "O"
		  end
		end

		context "#gameOver" do
		  it "returns :winner if winningGame? is true" do
		    board = Board.new
		    board.stub(:winningGame?){true}
		    expect(board.gameOver).to eq :winner
		  end
		 
		  it "returns :draw if winningGame? is false and tiedGame? is true" do
		    board = Board.new
		    board.stub(:winningGame?){false}
		    board.stub(:tiedGame?){true}
		    expect(board.gameOver).to eq :tied
		  end
		 
		  it "returns false if winningGame? is false and tiedGame? is false" do
		    board = Board.new
		    board.stub(:winningGame?){false}
		    board.stub(:tiedGame?){false}
		    expect(board.gameOver).to be false
		  end
		end

		context "#tiedGame?" do
			it "returns false if grid contains a blank" do
				TestCell = Struct.new(:piece)
		  	grid = [TestCell.new(" "), TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new(" "), TestCell.new(" "), TestCell.new("something"), TestCell.new("something")]
		  	board = Board.new(grid: grid)
		    expect(board.tiedGame?).to be false
		  end
		  it "returns true if grid does not contain a blank piece" do
		  	TestCell = Struct.new(:piece)
		  	grid = [TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new("something"), TestCell.new("something")]
		  	board = Board.new(grid: grid)
		    expect(board.tiedGame?).to be true
		  end
		end

		context "#winningGame?" do
			it "returns false if no winPattern filled" do
				TestCell = Struct.new(:piece)
				grid = [TestCell.new("X"),TestCell.new("O"),TestCell.new("X"),TestCell.new("X"),TestCell.new("O"),TestCell.new("O"),TestCell.new("O"),TestCell.new("X"),TestCell.new("X")]
				board = Board.new(grid: grid)
				expect(board.winningGame?).to be false
			end
			it "returns true if a winPattern is filled by all Xs" do
				TestCell = Struct.new(:piece)
				grid = [TestCell.new("X"),TestCell.new("O"),TestCell.new(" "),TestCell.new(" "),TestCell.new("X"),TestCell.new(" "),TestCell.new(" "),TestCell.new("O"),TestCell.new("X")]
				board = Board.new(grid: grid)
				expect(board.winningGame?).to be true
			end
		end

		TestCell = Struct.new(:piece)
		let(:xCell){TestCell.new("X")}
		let(:oCell){TestCell.new("O")}
		let(:blankCell){TestCell.new(" ")}

		context "#gameOver" do
			it "returns :winner when a winPattern is filled by all Os" do
				grid = [oCell, oCell, oCell, blankCell, blankCell, blankCell, blankCell, blankCell, blankCell,]
				board = Board.new(grid: grid)
				expect(board.gameOver).to eq :winner
			end
			it "returns :winner when a winPattern is filled by all Xs" do
				grid = [xCell, blankCell, blankCell, blankCell, xCell, blankCell, blankCell, blankCell, xCell,]
				board = Board.new(grid: grid)
				expect(board.gameOver).to eq :winner
			end
			it "returns false when a winPattern is filled by all blanks" do
				grid = [xCell, oCell, blankCell, oCell, xCell, blankCell, xCell, oCell, blankCell,]
				board = Board.new(grid: grid)
				expect(board.gameOver).to be false
			end
			it "returns :tied when there are no blanks left on the board" do
				grid = [xCell,oCell,xCell,xCell,oCell,oCell,oCell,xCell,xCell]
				board = Board.new(grid: grid)
				expect(board.gameOver).to eq :tied
			end
			it "returns false when there's no winner yet nor is the game a tie" do
				grid = [xCell, oCell, oCell, oCell, xCell, oCell, xCell, oCell, blankCell,]
				board = Board.new(grid: grid)
				expect(board.gameOver).to be false 
			end
		end

# ============ FOR FINDING CPU MOVE ==============
		# context "#findNonLosingMove" do
		# 	it "chooses the last empty spot of a winning pattern filled with 2 other Xs" do
		# 		grid = [xCell, oCell, blankCell, blankCell, blankCell, blankCell. blankCell, oCell, xCell]
		# 		board = Board.new(grid: grid)
		# 		expect(board.findNonLosingMove.var).to eq 4
		# 	end
		# end

  end
end










