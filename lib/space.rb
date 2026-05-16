# frozen_string_literal: true

class Space
  attr_accessor :marked_by
  attr_reader :name, :row, :column

  def initialize(name)
    @name = name
    @row = name[0]
    @column = name[1]
    if name == 'MM'
      @can_tl_diag = true
      @can_bl_diag = true
    elsif %w[TL BR].include?(name)
      @can_tl_diag = true
    elsif %w[BL TR].include?(name)
      @can_bl_diag = true
    else
      @can_tl_diag = false
      @can_bl_diag = false
    end
    @marked_by = '-'
  end

  def selected(player)
    @marked_by = player
  end
end
