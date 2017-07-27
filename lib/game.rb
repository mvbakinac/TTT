require "gosu"
require "./lib/position"


class Game < Gosu::Window
  attr_accessor :width

  def initialize
      width = 600
      super(width, width, false)
  end
end


game = Game.new
game.show
