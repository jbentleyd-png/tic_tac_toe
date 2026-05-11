# frozen_string_literal: true

require_relative 'lib/space'
require_relative 'lib/reset_board'

def start_game
  # reset any global vars or object properties or whatever
  board = new_board
  define_winning_lanes(board)
  puts "Let's play tic-tac-toe!"
end

def ask_move
  print 'Where would you like to play? '
  gets.chomp.upcase
end

start_game
