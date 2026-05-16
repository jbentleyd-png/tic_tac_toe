# frozen_string_literal: true

class Board
  attr_reader :space_list, :rows, :columns, :diags, :played_spaces
  attr_accessor :space_hash

  # upcase for standardization & colrow names, objects downcased
  @@space_list = %w[TL TM TR ML MM MR BL BM BR]

  def self.space_list
    @@space_list
  end

  def initialize
    @space_hash = {
      tl: Space.new(@@space_list[0]),
      tm: Space.new(@@space_list[1]),
      tr: Space.new(@@space_list[2]),
      ml: Space.new(@@space_list[3]),
      mm: Space.new(@@space_list[4]),
      mr: Space.new(@@space_list[5]),
      bl: Space.new(@@space_list[6]),
      bm: Space.new(@@space_list[7]),
      br: Space.new(@@space_list[8])
    }
    @rows = {
      top: [@space_hash[:tl], @space_hash[:tm], @space_hash[:tr]],
      middle: [@space_hash[:ml], @space_hash[:mm], @space_hash[:mr]],
      bottom: [@space_hash[:bl], @space_hash[:bm], @space_hash[:br]]
    }
    @columns = {
      left: [@space_hash[:tl], @space_hash[:ml], @space_hash[:bl]],
      middle: [@space_hash[:tm], @space_hash[:mm], @space_hash[:bm]],
      right: [@space_hash[:tr], @space_hash[:mr], @space_hash[:br]]
    }
    @diags = {
      top_left: [@space_hash[:tl], @space_hash[:mm], @space_hash[:br]],
      bottom_left: [@space_hash[:bl], @space_hash[:mm], @space_hash[:tr]]
    }
    @played_spaces = []
  end

  def move(input, game)
    @played_spaces.push(input)
    chosen_space = @space_hash[input.downcase.to_sym]
    chosen_space.marked_by = game.turn
  end

  def display_board
    puts "\t\t #{space_hash[:tl].marked_by} | #{space_hash[:tm].marked_by} | #{space_hash[:tr].marked_by}"
    puts "\t\t-----------"
    puts "\t\t #{space_hash[:ml].marked_by} | #{space_hash[:mm].marked_by} | #{space_hash[:mr].marked_by}"
    puts "\t\t-----------"
    puts "\t\t #{space_hash[:bl].marked_by} | #{space_hash[:bm].marked_by} | #{space_hash[:br].marked_by}"
  end
end
