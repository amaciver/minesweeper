require_relative 'square'
require 'byebug'
class Board
  attr_reader :grid, :size

  def initialize
    @grid = Array.new(9){Array.new(9) { Square.new } }
    @size = 9
  end

  def seed_bombs
    count = 0
    until count == 12
      new_pos = rand_pos
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

  def process_neighbors
    i = 0
    while i < @size
      j = 0
      while j < @size
        self[[i,j]].num_nearby = find_nearby([i,j]) # sets num_nearby to the number from find_nearby
        j += 1
      end
      i +=1
    end
  end

  def find_nearby(pos)
    count = 0
    bombs = []
    neighbor_positions(pos).each do |sur_pos|
      count += 1 if self[sur_pos].identity == :bomb
    end
    count
  end

  def neighbor_positions(pos)
    x,y = pos
    above_row = [[x-1,y-1],[x,y-1],[x+1,y-1]]
    same_row = [[x-1,y],[x+1,y]]
    below_row = [[x-1,y+1],[x,y+1],[x+1,y+1]]

    all_squares = above_row.concat(same_row.concat(below_row))

    all_squares = all_squares.select { |pos| pos[0].between?(0,@size-1) }
    all_squares.select { |pos| pos[1].between?(0,@size-1) }

  end

  def render
    grid.each do |row|
      print "\n"
      row.each do |el|
        print el.display
      end
    end
  end
end
