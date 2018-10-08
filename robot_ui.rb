require "./robot"

class RobotUI

  def initialize
    @robot = Robot.new(0, 0, Robot::NORTH)
    @initial_placement_done = false
    @alive = true
  end

  def is_alive?
    @alive
  end

  def execute(command)
    if !@initial_placement_done
      do_initial_placement(command)
    else
      execute_command(command)
    end
  end

  private

  def do_initial_placement(command)
    if place_command?(command)
      place = parse_place(command)
      begin
        @robot.set_place(place[:x],
                         place[:y],
                         place[:direction])
      rescue ArgumentError
        puts "Invalid place."
      end
      @initial_placement_done = true
    else
      puts "You need to set initial place for robot first."
    end
  end

  def execute_command(command)
    if place_command?(command)
      place = parse_place(command)
      begin
        @robot.set_place(place[:x],
                         place[:y],
                         place[:direction])
      rescue ArgumentError
        puts "Invalid place."
      end
    elsif command == "MOVE"
      @robot.move!
    elsif command == "RIGHT"
      @robot.right!
    elsif command == "LEFT"
      @robot.left!
    elsif command == "REPORT"
      @robot.report!
      @alive = false
    else
      puts "Unknown command."
    end
  end

  def place_command?(command)
    includes_place = command.include?("PLACE")

    command.slice!("PLACE ")
    x_raw, y_raw, direction = command.split(",")

    includes_place &&
      valid_number?(x_raw) &&
      valid_number?(y_raw)
  end

  def parse_place(command)
    command.slice!("PLACE ")
    x_raw, y_raw, direction = command.split(",")

    x = x_raw.to_i
    y = y_raw.to_i

    {x: x, y: y, direction: direction}
  end

  def valid_number?(str)
    !!Integer(str)
    true
  rescue ArgumentError, TypeError
    false
  end

end
