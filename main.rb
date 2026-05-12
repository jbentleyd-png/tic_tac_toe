# frozen_string_literal: true

require_relative 'lib/space'
require_relative 'lib/board'
require_relative 'lib/winning_lanes'

def start_game
  # reset any global vars or object properties or whatever
  board = Board.new
  winning_lanes = define_winning_lanes(board)
  puts "Let's play tic-tac-toe!"
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
end

def make_move(player)
  player_input = ask_move
  # space = Board.find_space(player_input)
  puts "#{space.name} was played"
end

# start_game
# make_move('player 1')
Board.new.display_board
ask_move
