# frozen_string_literal: true

require_relative 'lib/space'
require_relative 'lib/board'
require_relative 'lib/game'

def start_game
  # reset any global vars or object properties or whatever
  board = Board.new
  puts "Let's play tic-tac-toe!"
  board
end

def input_ok?(input)
  Board.space_list.each { |name| return true if input == name }
  false
end

def input_possible?(input, board)
  board.played_spaces.each { |name| return false if input == name }
  true
end

def ask_move(board, game)
  if game.round == 1
    puts 'Please input your move like this: '
    puts "\t\"tr\" (meaning top-right)\n\t\"mm\" (meaning middle-middle)\n\t\"bl\" (meaning bottom-left)"
  end

  print "Player #{game.turn}, where would you like to play? "
  input = gets.chomp.upcase

  until input_ok?(input)
    puts 'Please input your move like this: '
    puts "\t\"tr\" (meaning top-right)\n\t\"mm\" (meaning middle-middle)\n\t\"bl\" (meaning bottom-left)"
    print 'Bad input, try again: '
    input = gets.chomp.upcase
  end

  until input_possible?(input, board)
    print 'Space already taken, try again: '
    input = gets.chomp.upcase
  end
  input
end

def make_move(board, game)
  game.move
  valid_input = ask_move(board, game)
  board.move(valid_input, game)
  board.display_board # move to other method?
end

# board = start_game
# game = Game.new
# make_move(board, game)
# make_move(board, game)
# make_move(board, game)
# make_move(board, game)
# puts board.check_win?(game)
# make_move(board, game)
# puts board.check_win?(game)

def play_game
  board = start_game
  game = Game.new

  make_move(board, game) until board.check_win?(game)
  puts "#{game.winner} wins! GG, fam."
end

play_game
