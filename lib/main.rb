require_relative 'board.rb'
require_relative 'game.rb'
require_relative 'player.rb'
board = Board.new
game = Game.new(board)
game.play