class Board
  attr_reader :space_list
  attr_accessor :tl, :tm, :tr, :ml, :mm, :mr, :bl, :bm, :br

  # inputs capitalized, objects downcased
  @@space_list = %w[TL TM TR ML MM MR BL BM BR]

  def self.space_list
    @@space_list
  end

  def initialize
    @tl = Space.new(@@space_list[0])
    @tm = Space.new(@@space_list[1])
    @tr = Space.new(@@space_list[2])
    @ml = Space.new(@@space_list[3])
    @mm = Space.new(@@space_list[4])
    @mr = Space.new(@@space_list[5])
    @bl = Space.new(@@space_list[6])
    @bm = Space.new(@@space_list[7])
    @br = Space.new(@@space_list[8])
  end

  def find_space(player_input)
    @space_list.find { |name| name == player_input }
  end

  def display_board
    puts "\t\t #{tl.marked_by} | #{tm.marked_by} | #{tr.marked_by}"
    puts "\t\t-----------"
    puts "\t\t #{ml.marked_by} | #{mm.marked_by} | #{mr.marked_by}"
    puts "\t\t-----------"
    puts "\t\t #{bl.marked_by} | #{bm.marked_by} | #{br.marked_by}"
  end
end
