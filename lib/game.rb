class Game
  attr_accessor :turn, :round, :winner, :board

  def initialize
    @turn = 'X'
    @round = 0
    @winner = nil
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
