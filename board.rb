require_relative 'square'
require 'byebug'
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(9){Array.new(9) { Square.new } }
  end

  def seed_bombs
    count = 0
    until count == 12
      new_pos = rand_pos
      debugger
      unless self[new_pos].identity == :bomb
        place_bomb(new_pos)
        count += 1
      end
    end
  end

  def rand_pos
    [rand(9), rand(9)]
  end

  def place_bomb(pos)
    self[pos].identity = :bomb
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos,value)
    x,y = pos
    @grid[x][y] = value
  end

  def neighbors(square)
  end


end
