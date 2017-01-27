class Square
  attr_accessor :identity, :num_nearby, :revealed

  def initialize
    @identity = :empty
    @num_nearby = nil
    @revealed = false
    @current_icon = "|_|"
  end

  def has_bomb?
  end

  def reveal
    @current_icon = " * " if self.identity == :bomb
    @current_icon = " P " if self.identity == :flag
    @current_icon = " #{num_nearby} " if self.identity == :empty
    @revealed = true
  end

  def hide
  end

  def flag_me
    @identity = :flag
  end

  def position
  end

  def display
    @current_icon
  end











end
