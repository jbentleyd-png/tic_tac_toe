# frozen_string_literal: true

class Space
  attr_accessor :marked_by
  attr_reader :name, :row, :column, :tl, :bl

  def initialize(name)
    @name = name
    @row = name[0].to_sym
    @column = name[1].to_sym
    if name == 'MM'
      @tl = :top_left
      @bl = :bottom_left
    elsif %w[TL BR].include?(name)
      @tl = :top_left
      @bl = :none # avoids using a method on nil in board.check_win()
    elsif %w[BL TR].include?(name)
      @tl = :none
      @bl = :bottom_left
    else
      @tl = :none
      @bl = :none
    end
    @marked_by = '-'
  end

  def selected(player)
    @marked_by = player
  end
end
