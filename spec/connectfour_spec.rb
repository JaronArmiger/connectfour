require './lib/board.rb'
require './lib/game.rb'
require './lib/player.rb'

describe Board do
	before { @board = Board.new }
	describe "#update" do
		it "adds symbol to board in given column" do
			@board.update(3,"X")
			expect(@board.field[3]).to eql(["X"])
		end

		it "adds symbol to column when column already contains symbol" do
			@board.update(3, "X")
			@board.update(3, "O")
			expect(@board.field[3]).to eql(["X","O"])
		end
	end

	describe "#col_full?" do
		it "returns true when column is full" do
			6.times do |n|
				@board.field[0] << n
			end
			expect(@board.col_full?(0)).to be true
		end
	end

	describe "board_full?" do
		it "returns true if board is full" do
			7.times do |x|
				6.times do |y|
					@board.field[x] << y
				end
			end
			expect(@board.board_full?).to be true
		end
	end

	describe "winner?" do
		it "returns true for four consecutive O's in a column" do
			field = @board.field
			field[3] << "X"
			4.times do
				field[3] << "O"
			end
			expect(@board.winner?).to be true
		end
		it "returns false for less than four consecutive O's in a column" do
			field = @board.field
			field[3] << "X"
			3.times do
				field[3] << "O"
			end
			expect(@board.winner?).to be false
		end

		it "returns true for four consecutive O's in a row" do
			field = @board.field
			4.times do |n|
				field[n+2] << "X"
			end
			expect(@board.winner?).to be true
		end

		it "returns false for less than four consecutive O's in a row" do
			field = @board.field
			3.times do |n|
				field[n+2] << "X"
			end
			expect(@board.winner?).to be false
		end

		it "returns true for four O's along diagonal going to the right" do
			field = @board.field
			field[1] << "O"
			field[2] << "X"
			field[2] << "O"
			field[3] << "O" 
			field[3] << "X" 
			field[3] << "O" 
			field[4] << "X" 
			field[4] << "X" 
			field[4] << "O" 
			field[4] << "O" 
			expect(@board.winner?).to be true
		end
		it "returns false for less thanfour O's along diagonal going to the right" do
			field = @board.field
			field[1] << "O"
			field[2] << "X"
			field[2] << "O"
			field[3] << "O" 
			field[3] << "X" 
			field[3] << "O" 
			field[4] << "X" 
			field[4] << "X" 
			field[4] << "O" 
			expect(@board.winner?).to be false
		end

		it "returns true for four O's along diagonal going to the left" do
			field = @board.field

			field[2] << "O"
			field[2] << "O"
			field[2] << "O"
			field[2] << "X"
			field[2] << "X"
			field[2] << "O"

			field[3] << "O"
			field[3] << "X"
			field[3] << "X"
			field[3] << "O"
			field[3] << "O"

			field[4] << "X"
			field[4] << "O"
			field[4] << "X"
			field[4] << "O"

			field[5] << "X" 
			field[5] << "X" 
			field[5] << "O" 
			expect(@board.winner?).to be true
		end
		it "returns false for less thanfour O's along diagonal going to the left" do
			field = @board.field
			field[2] << "O"
			field[2] << "O"
			field[2] << "O"
			field[2] << "X"
			field[2] << "X"
			field[2] << "O"

			field[3] << "O"
			field[3] << "X"
			field[3] << "X"
			field[3] << "O"
			field[3] << "O"

			field[4] << "X"
			field[4] << "O"
			field[4] << "X"
			field[4] << "O"

			field[5] << "X" 
			field[5] << "X" 
			@board.show
			expect(@board.winner?).to be false
		end
	end
end

describe Game do
	before { 
		@board = Board.new
		@game = Game.new(@board) }
=begin
	describe "#start" do
		it "calls #show on board" do
			expect(@board).to receive(:show)
			@game.start
		end
	end
=end
end

describe Player do
	
end