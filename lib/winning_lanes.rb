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
