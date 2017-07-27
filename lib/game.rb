require "gosu"
require "./lib/position"


class Game < Gosu::Window
  attr_accessor :width, :cell_width, :position

  def initialize
      @width = 600
      @cell_width = @width / 3
      @position = Position.new
      super(width, width, false)
      @font = Gosu::Font.new(self, Gosu::default_font_name, cell_width)
      @mfont = Gosu::Font.new(self, Gosu::default_font_name, cell_width/3)
  end
  def needs_cursor?
     true
  end

  def button_down(idk)
    case idk
       when Gosu::KbQ then close
       when Gosu::MsLeft then
           @position = @position.move((mouse_x/cell_width).to_i + 3*(mouse_y/cell_width).to_i)
    end
  end 

  def draw
   # draw grid
    [cell_width, cell_width * 2].each do |w|
      draw_line(w, 0, Gosu::Color::WHITE, w, width, Gosu::Color::WHITE)
      draw_line(0, w, Gosu::Color::WHITE, width, w, Gosu::Color::WHITE)
    end
   # draw position
    position.board.each_with_index do |p,i|
       if p != "-"
        x = (i%3)*cell_width + @font.text_width(p)/2
        y = (i/3)*cell_width
        @font.draw(p, x, y, 0) 
        end
    end
  end
end


game = Game.new
game.show
