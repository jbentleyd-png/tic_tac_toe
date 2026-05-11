# frozen_string_literal: true

class Space
  attr_accessor :name, :row, :column, :marked_by

  def initialize(name)
    @name = name
    @row = if name[0] == 'T'
             'top'
           else
             name[0] == 'M' ? 'middle' : 'bottom'
           end
    @column = if name[1] == 'L'
                'left'
              else
                name[1] == 'M' ? 'middle' : 'right'
              end
    @marked_by = nil
  end
end
