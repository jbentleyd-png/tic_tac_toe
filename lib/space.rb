class Space
  @@spaces_count = 0

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
    puts "#{@row}, #{@column}"
    @@spaces_count += 1
  end

  def self.count_spaces
    puts "#{@@spaces_count} spaces made"
  end
end
