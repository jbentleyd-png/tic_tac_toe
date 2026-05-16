class Game
  attr_accessor :turn, :round, :winner, :board

  def initialize
    @turn = 'X'
    @round = 1
    @winner = nil
  end

  def start
  end

  def ask_move
  end
end
