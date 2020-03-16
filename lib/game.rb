class Game
	def initialize(board)
		@board = board
	end

	def start
		puts "welcome to Connect 4!"
		puts "player 1 what's your name?"
		p1_name = gets.chomp
		while 1
			puts "and what symbol would you like to play with?"
			p1_sym = gets.chomp
			if p1_sym.length == 1
				break
			else
				puts "symbol has to be of length 1"
			end
		end
		@player1 = Player.new(p1_name,p1_sym)
		puts "player 2 what's your name?"
		p2_name = gets.chomp
		while 1
			puts "and what symbol would you like to play with?"
			p2_sym = gets.chomp
			if p2_sym.length == 1
				break
			else
				puts "symbol has to be of length 1"
			end
		end
		@player2 = Player.new(p2_name,p2_sym)
		puts "here's the board!"
		@board.show
	end

	def round(player)
		puts "#{player.name} choose a column!"
		while 1
			choice = gets.chomp
			if choice.length == 1 && choice =~ /\d/
				choice = choice.to_i - 1
				if @board.col_full?(choice)
					puts "that column's already full :( choose another"
				else
					break
				end
				
			else
				puts "invalid choice :( try again"
			end
		end
		@board.update(choice, player.sym)
		@board.show
	end

	def play
		start
		until @board.board_full?
			round(@player1)
			if @board.winner?
				puts "#{@player1.name}, you win!"
				break
			end
			round(@player2)
			if @board.winner?
				puts "#{@player2.name}, you win!"
				break
			end
		end
	end
end