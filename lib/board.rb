class Board
	attr_accessor :field
	
	def initialize
		@field = make_field
	end

	def make_field
		field = []
		7.times do
			cell = []
=begin
			6.times do |n|
				cell << n
			end
=end
			field << cell
		end
		field
	end

	def show
		col_list = ""
		7.times do |n|
			col_list << "  #{n+1}  "
		end
		puts col_list
		[5,4,3,2,1,0].each do |i|
			row = ""
			7.times do |j|
				if field[j][i]
					row << "| #{field[j][i]} |"
				else
					row << "|   |"
				end
			end
			puts row
		end
	end

	def update(col,sym)
		field[col].push(sym)
	end

	def col_full?(col)
		if @field[col].length==6
			return true
		else
			return false
		end
	end

	def board_full?
		full = true
		@field.each do |column|
			if column.length != 6
				full = false
			end
		end
		full
	end

	def vertical_winner?
		winner = false
		@field.each do |column|
			count = 0
			sym = ""
			column.each do |el|
				if el == sym && el != nil
					count += 1
				else
					sym = el
					count = 1
				end
				if count == 4
					winner = true
					break
				end
			end
			if winner == true
				break
			end
		end
		winner
	end

	def horizontal_winner?
		winner = false
		6.times do |n|
			sym = ""
			count = 0
			@field.each_with_index do |column,col_num|
=begin
				print "old_sym "
				p sym
				print "#{col_num} column[#{n}] "
				p column[n]
=end
				if column[n] == sym && sym != nil
					count += 1
				else
					sym = column[n]
					count = 1
				end
=begin
				puts "count #{count}"
				print "new_sym: "
				p sym
				puts ""
=end
				if count == 4
					#puts "final count: #{count}"
					winner = true
					break
				end
			end
			if winner == true
				
				break
			end
		end
		winner
	end

	def diagonal_winner_right?
		winner = false
		
		7.times do |i| # columns
			#puts "new i loop i #{i}"

			sym = ""
			count = 0
			i_idx = i
			6.times do |j| # rows
				#puts "new j loop j #{j}"
				j_idx = j
				until i_idx == 7 
=begin
					print "old_sym "
					p sym
					print "column: #{col_num} idx: #{idx} "
					p column[idx]
=end

					if @field[i_idx][j_idx] == sym  && @field[i_idx][j_idx] != nil
						count += 1
					else
						sym = @field[i_idx][j_idx]
						count = 1
					end
					i_idx += 1
					j_idx += 1
=begin
					puts "\told i_idx #{i_idx}"
					puts "\told j_idx #{j_idx}"
					
					puts "\tnew i_idx #{i_idx}"
					puts "\tnew j_idx #{j_idx}"
					puts ""

					puts "count #{count}"
					print "new_sym: "
					p sym
					puts ""

=end				
					if count == 4
						winner = true
						break
					end

					break if j_idx > 5
				end
				i_idx = 0
				#break if j_idx > 5
			end
			if winner == true
				break
			end
		end
		winner
	end

	def diagonal_winner_left?
		winner = false
		
		7.times do |i| # columns
			#puts "new i loop i #{i}"

			sym = ""
			count = 0
			i_idx = i
			[5,4,3,2,1].each do |j| # rows
				#puts "new j loop j #{j}"
				j_idx = j
				until i_idx == 7 
=begin
					print "old_sym "
					p sym
					print "column: #{col_num} idx: #{idx} "
					p column[idx]
=end

					if @field[i_idx][j_idx] == sym  && @field[i_idx][j_idx] != nil
						count += 1
					else
						sym = @field[i_idx][j_idx]
						count = 1
					end
					i_idx += 1
					j_idx -= 1
=begin
					puts "\told i_idx #{i_idx}"
					puts "\told j_idx #{j_idx}"
					
					puts "\tnew i_idx #{i_idx}"
					puts "\tnew j_idx #{j_idx}"
					puts ""

					puts "count #{count}"
					print "new_sym: "
					p sym
					puts ""

=end				
					if count == 4
						winner = true
						break
					end

					break if j_idx < 0
				end
				i_idx = 0
				#break if j_idx > 5
			end
			if winner == true
				break
			end
		end
		winner
	end

	def winner?
		winner = false
		if vertical_winner?
			return true
		end
		if horizontal_winner?
			return true
		end
		if diagonal_winner_right?
			return true
		end
		if diagonal_winner_left?
			return true
		end
		winner
	end
end

=begin

board = Board.new

field = board.field
field[3] << "O"
field[3] << "O"
field[3] << "O"
field[3] << "X"
field[3] << "X"
field[3] << "O"

field[4] << "O"
field[4] << "X"
field[4] << "X"
field[4] << "O"
field[4] << "O"

field[5] << "X"
field[5] << "O"
field[5] << "X"
field[5] << "O"

field[6] << "X" 
field[6] << "X" 
field[6] << "O" 

board.show 
p board.diagonal_winner_left?
=end






