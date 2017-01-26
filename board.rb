class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(9){Array.new(9)}
  end

  def seed_bombs
    count = 0
    until count == 12
      new_pos = rand_pos
      unless self[new_pos] == :bomb
        place_bomb(new_pos)
        count += 1
      end
    end
  end

  def rand_pos
    [rand(10), rand(10)]
  end

  def place_bomb(pos)
    self[pos] = :bomb
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos,value)
    x,y = pos
    @grid[x][y] = value
  end


end
