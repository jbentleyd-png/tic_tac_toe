# frozen_string_literal: true

require_relative 'lib/space'
require_relative 'lib/board'
require_relative 'game'

def start_game
  # reset any global vars or object properties or whatever
  board = Board.new
  # winning_lanes = define_winning_lanes(board)
  puts "Let's play tic-tac-toe!"
  board
end

def input_ok?(input)
  Board.space_list.each { |name| return true if input == name }
  false
end

def ask_move
  puts 'Please input your move like this: '
  puts "\t\"tr\" (meaning top-right)\n\t\"mm\" (meaning middle-middle)\n\t\"bl\" (meaning bottom-left)"
  print 'Where would you like to play? '
  input = gets.chomp.upcase
  until input_ok?(input)
    print 'Bad input, try again: '
    input = gets.chomp.upcase
  end
  input
end

def make_move(player, board, game)
  player_input = ask_move.downcase.to_sym
  chosen_space = board.space_hash[player_input]
  chosen_space.marked_by = player
  game.round += 1
  game.turn = if game.turn == 'X'
                'O'
              else
                'X'
              end
  puts game.round
  board.display_board # move to other method?
end

board = start_game
game = Game.new
make_move(game.turn, board, game)
make_move(game.turn, board, game)
make_move(game.turn, board, game)

# ask_move
