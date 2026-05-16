class Game
  attr_accessor :turn, :round, :winner, :board
  attr_reader :played_spaces

  def initialize
    @turn = 'O'
    @round = 0
    @winner = nil
  end

  def move
    @round += 1
    @turn = if @turn == 'O'
              'X'
            else
              'O'
            end
    puts "Round #{@round}:"
  end
end
