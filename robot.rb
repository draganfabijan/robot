class Robot
  NORTH = "NORTH"
  SOUTH = "SOUTH"
  EAST = "EAST"
  WEST = "WEST"
  BOARD = 5
  DIRECTIONS = [NORTH, SOUTH, EAST, WEST]

  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    set_place(x, y, direction)
  end

  def set_place(x, y, direction)
    validate_arguments(x, y, direction)

    @x = x
    @y = y
    @direction = direction
  end

  def report!
    puts "#{@x}, #{@y}, #{@direction}"
  end

  def move!
    if move_north?
      @y += 1
    elsif move_south?
      @y -= 1
    elsif move_east?
      @x += 1
    elsif move_west?
      @x -= 1
    end
  end

  def move_north?
    direction == NORTH && @y != BOARD - 1
  end

  def move_south?
    direction == SOUTH && @y != 0
  end

  def move_east?
    direction == EAST && @x != BOARD - 1
  end

  def move_west?
    direction == WEST && @x != 0
  end

  def right!
    case direction
    when EAST
      self.direction = SOUTH
    when SOUTH
      self.direction = WEST
    when WEST
      self.direction = NORTH
    when NORTH
      self.direction = EAST
    end
  end

  def left!
    case direction
    when EAST
      self.direction = NORTH
    when SOUTH
      self.direction = EAST
    when WEST
      self.direction = SOUTH
    when NORTH
      self.direction = WEST
    end
  end

  private

  def validate_arguments(x, y, direction)
    if (x < 0 || x >= BOARD) ||
        (y < 0 || y >= BOARD) ||
        !Robot::DIRECTIONS.include?(direction)
      raise ArgumentError
    end
  end
end
