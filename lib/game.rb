class Game
  attr_accessor :turn, :round, :winner, :board
  attr_reader :played_spaces

  def initialize
    @turn = 'X'
    @round = 0
    @winner = nil
    @played_spaces = []
  end

  def move
    @round += 1
    @turn = if @turn == 'X'
              'O'
            else
              'X'
            end
    puts @round
  end
end
