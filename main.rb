# frozen_string_literal: true

require_relative 'lib/space'

def new_board
  %w[TL TM TR ML MM MR BL BM BR].each do |name|
    Space.new(name)
  end
end

def start_game
  # reset any global vars or object properties or whatever
  new_board
  puts "Let's play tic-tac-toe!"
end

def ask_move
  print 'Where would you like to play? '
  gets.chomp.upcase
end

start_game
p ask_move
Space.count_spaces
