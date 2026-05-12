class Board
  attr_reader :space_list
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
  end

  def find_space(player_input)
    @space_list.find { |name| name == player_input }
  end

  def display_board
    puts "\t\t #{space_hash[:tl].marked_by} | #{space_hash[:tm].marked_by} | #{space_hash[:tr].marked_by}"
    puts "\t\t-----------"
    puts "\t\t #{space_hash[:ml].marked_by} | #{space_hash[:mm].marked_by} | #{space_hash[:mr].marked_by}"
    puts "\t\t-----------"
    puts "\t\t #{space_hash[:bl].marked_by} | #{space_hash[:bm].marked_by} | #{space_hash[:br].marked_by}"
  end
end
