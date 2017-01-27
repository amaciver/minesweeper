require_relative 'board'

class Game
  def initialize(size = 9)
    @size
    @board = Board.new

  end

  def take_turn
    @board.render
    get_action

  end

  def get_action
    puts "flag or guess? (f/g)"
    action = gets.chomp
    if action == "f"
      prompt_flag
    else
      prompt_guess
    end
  end

  def prompt_guess
    puts "enter position"
    pos_string = gets.chomp
    pos = pos_string.split(",").map! { |el| el.to_i }
    @board.process_guess(pos)
  end

  def prompt_flag
    puts "enter position"
    pos_string = gets.chomp
    pos = pos_string.split(",").map! { |el| el.to_i }
    @board.process_flag(pos)
  end

  def play
    @board.seed_bombs
    @board.process_neighbors
    until false
      take_turn
    end
  end

  def lost?
    @board.grid.flatten.any? { |square| square.revealed && square.identity == :bomb }
  end

  def won?
    @board.grid.flatten.all? { |square| square.revealed }
  end

end
