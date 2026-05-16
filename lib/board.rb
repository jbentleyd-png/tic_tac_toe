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
    @possible_lanes = {
      rows: {
        T: [@space_hash[:tl], @space_hash[:tm], @space_hash[:tr]],
        M: [@space_hash[:ml], @space_hash[:mm], @space_hash[:mr]],
        B: [@space_hash[:bl], @space_hash[:bm], @space_hash[:br]]
      },
      columns: {
        L: [@space_hash[:tl], @space_hash[:ml], @space_hash[:bl]],
        M: [@space_hash[:tm], @space_hash[:mm], @space_hash[:bm]],
        R: [@space_hash[:tr], @space_hash[:mr], @space_hash[:br]]
      },
      diags: {
        top_left: [@space_hash[:tl], @space_hash[:mm], @space_hash[:br]],
        bottom_left: [@space_hash[:bl], @space_hash[:mm], @space_hash[:tr]]
      }
    }

    @played_spaces = []
    @last_played_space = nil
  end

  def move(input, game)
    @played_spaces.push(input)
    @last_played_space = @space_hash[input.downcase.to_sym]
    @last_played_space.marked_by = game.turn
  end

  def check_win?(game)
    return false if game.round < 5

    lanes_to_check = {
      row: @possible_lanes[:rows][@last_played_space.row],
      column: @possible_lanes[:columns][@last_played_space.column]
    }
    if @last_played_space.instance_variable_defined?(:@tl)
      lanes_to_check[:tl] =
        @possible_lanes[:diags][@last_played_space.tl]
    end
    if @last_played_space.instance_variable_defined?(:@bl)
      lanes_to_check[:bl] =
        @possible_lanes[:diags][@last_played_space.bl]
    end

    lanes_to_check.each_value do |lane|
      p lane.length
      next unless lane.all? { |space| space.marked_by == game.turn }

      game.winner = game.turn
      p game.winner
      return true
    end

    if game.round == 9
      game.winner = 'Nobody'
      return true # ends the game when spaces are filled
    end
    false
  end

  def display_board
    puts "\t\t #{space_hash[:tl].marked_by} | #{space_hash[:tm].marked_by} | #{space_hash[:tr].marked_by}"
    puts "\t\t-----------"
    puts "\t\t #{space_hash[:ml].marked_by} | #{space_hash[:mm].marked_by} | #{space_hash[:mr].marked_by}"
    puts "\t\t-----------"
    puts "\t\t #{space_hash[:bl].marked_by} | #{space_hash[:bm].marked_by} | #{space_hash[:br].marked_by}"
  end
end
