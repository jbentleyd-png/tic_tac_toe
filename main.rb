# frozen_string_literal: true

require_relative 'lib/space'
require_relative 'lib/reset_board'

def start_game
  # reset any global vars or object properties or whatever
  board = new_board
  define_winning_lanes(board)
  puts "Let's play tic-tac-toe!"
end

def input_ok?(input)
  %w[TL TM TR ML MM MR BL BM BR].each { |name| return true if input == name }
  false
end

def ask_move
  puts "Please input your move like this:\n\t\"tr\" (meaning top-right)\n\t\"mm\" (meaning middle-middle)\n\t\"bl\" (meaning bottom-left)"
  print 'Where would you like to play? '
  input = gets.chomp.upcase
  until input_ok?(input)
    print 'Bad input, try again: '
    input = gets.chomp.upcase
  end
end

start_game
ask_move
