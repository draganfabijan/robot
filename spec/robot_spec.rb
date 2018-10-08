require "./robot"

RSpec.describe Robot do

  describe "set_place" do
    context "valid data" do
      it "not raising an error" do
        expect do
          Robot.new(4, 1, Robot::NORTH)
        end.not_to raise_error(ArgumentError)
      end
    end
    context "invalid data - x" do
      it "raises ArgumentError exception" do
        expect do
          Robot.new(5, 1, Robot::NORTH)
        end.to raise_error(ArgumentError)
      end
    end
    context "invalid data - y" do
      it "raises ArgumentError exception" do
        expect do
          Robot.new(2, 10, Robot::NORTH)
        end.to raise_error(ArgumentError)
      end
    end
    context "invalid data - direction" do
      it "raises ArgumentError exception" do
        expect do
          Robot.new(2, 10, "VERYNORTH")
        end.to raise_error(ArgumentError)
      end
    end
  end

  describe "report!" do
    context "when robot gets place" do
      it "puts place" do
        expect do
          Robot.new(1, 1, Robot::NORTH).report!
        end.to output("1, 1, NORTH\n").to_stdout
      end
    end
  end

  describe "#move!" do
    context "when position is 0,0 NORTH" do
      it "returns 1 for y" do
        robot = Robot.new(0, 0, "NORTH")
        robot.move!
        expect(robot.y).to eql(1)
      end
    end
    context "when position is 0,4 NORTH" do
      it "returns 4 for y" do
        robot = Robot.new(0, 4, "NORTH")
        robot.move!
        expect(robot.y).to eql(4)
      end
    end
    context "when position is 0,0 SOUTH" do
      it "returns 0 for y" do
        robot = Robot.new(0, 0, "SOUTH")
        robot.move!
        expect(robot.y).to eql(0)
      end
    end
    context "when position is 0,4 SOUTH" do
      it "returns 3 for y" do
        robot = Robot.new(0, 4, "SOUTH")
        robot.move!
        expect(robot.y).to eql(3)
      end
    end

    context "when position is 0,2 EAST" do
      it "returns 0 for x" do
        robot = Robot.new(0, 2, "EAST")
        robot.move!
        expect(robot.x).to eql(1)
      end
    end
    context "when position is 4,2 EAST" do
      it "returns 4 for x" do
        robot = Robot.new(4, 2, "EAST")
        robot.move!
        expect(robot.x).to eql(4)
      end
    end
    context "when position is 0,2 WEST" do
      it "returns 0 for x" do
        robot = Robot.new(0, 1, "WEST")
        robot.move!
        expect(robot.x).to eql(0)
      end
    end
    context "when position is 4,3 WEST" do
      it "returns 3 for x" do
        robot = Robot.new(4, 3, "WEST")
        robot.move!
        expect(robot.x).to eql(3)
      end
    end
  end

  describe "#right!" do
    context "when direction NORTH command right!" do
      it "returns WEST" do
        robot = Robot.new(0, 0, "NORTH")

        expect(robot.right!).to eql(Robot::EAST)
      end
    end

    context "when direction EAST command right!" do
      it "returns SOUTH" do
        robot = Robot.new(0, 0, "EAST")

        expect(robot.right!).to eql(Robot::SOUTH)
      end
    end
    context "when direction SOUTH command right!" do
      it "returns WEST" do
        robot = Robot.new(0, 0, "SOUTH")

        expect(robot.right!).to eql(Robot::WEST)
      end
    end
    context "when direction WEST command right! twice" do
      it "returns EAST" do
        robot = Robot.new(0, 0, "WEST")
        robot.right!
        expect(robot.right!).to eql(Robot::EAST)
      end
    end
  end
  describe "#left!" do
    context "when direction NORTH command left!" do
      it "returns WEST" do
        robot = Robot.new(0, 0, "NORTH")

        expect(robot.left!).to eql(Robot::WEST)
      end
    end
    context "when direction EAST command left!" do
      it "returns NORTH" do
        robot = Robot.new(0, 0, "EAST")

        expect(robot.left!).to eql(Robot::NORTH)
      end
    end
    context "when direction SOUTH command left!" do
      it "returns EAST" do
        robot = Robot.new(0, 0, "SOUTH")

        expect(robot.left!).to eql(Robot::EAST)
      end
    end
    context "when direction WEST command left!" do
      it "returns SOUTH" do
        robot = Robot.new(0, 0, "WEST")

        expect(robot.left!).to eql(Robot::SOUTH)
      end
    end
    context "when direction WEST command left! three times" do
      it "returns NORTH" do
        robot = Robot.new(0, 0, "WEST")
        robot.left!
        robot.left!
        expect(robot.left!).to eql(Robot::NORTH)
      end
    end
  end
end
