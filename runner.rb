require "./robot_ui"

class Runner

  def initialize
    @robot_ui = RobotUI.new
  end

  def run
    puts """
Usage:
  PLACE x,y,direction
  MOVE
  LEFT
  RIGHT
  REPORT

Enter your commands:
    """

    while @robot_ui.is_alive?
      command = gets.chomp

      @robot_ui.execute(command)
    end
  end

end

Runner.new.run
