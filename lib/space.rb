class Space
  @@spaces_count = 0

  def initialize(name)
    @name = name
    @@spaces_count += 1
  end

  def self.count_spaces
    puts "#{@@spaces_count} spaces made"
  end
end
