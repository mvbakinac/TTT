class Position
  attr_accessor :board, :turn
  DIM = 3
  SIZE = DIM * DIM
  def initialize(board = nil, turn = "x")
     @board = board || %w(-)*SIZE
     @turn = turn
  end
end
