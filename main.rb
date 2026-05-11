# frozen_string_literal: true

require_relative 'lib/space'

def new_board
  board = []
  %w[TL TM TR ML MM MR BL BM BR].each do |name|
    board.push Space.new(name)
  end
  board
end

def define_winning_rows(board)
  top_row = []
  middle_row = []
  bottom_row = []
  board.each do |space|
    if space.row == 'top'
      top_row.push space
    elsif space.row == 'middle'
      middle_row.push space
    else
      bottom_row.push space
    end
  end
  { top_row: top_row, middle_row: middle_row, bottom_row: bottom_row }
end

def define_winning_columns(board)
  left_column = []
  middle_column = []
  right_column = []
  board.each do |space|
    if space.column == 'left'
      left_column.push space
    elsif space.column == 'middle'
      middle_column.push space
    else
      right_column.push space
    end
  end
  { left_column: left_column, middle_column: middle_column, right_column: right_column }
end

def define_winning_diagonals(board)
  tl_diag = []
  bl_diag = []
  tl_diag.push(board[0], board[4], board[8])
  bl_diag.push(board[6], board[4], board[2])
  { tl_diag: tl_diag, bl_diag: bl_diag }
end

def define_winning_lanes(board)
  output = {
    rows: define_winning_rows(board),
    columns: define_winning_columns(board),
    diags: define_winning_diagonals(board)
  }
  puts output
  output
end

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
