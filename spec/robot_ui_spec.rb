require "./robot_ui"

describe RobotUI do

  describe "execute" do
    context "Command without initial placement" do
      it "puts error message" do
        ui = RobotUI.new

        expect do
          ui.execute("MOVE")
        end.to output("You need to set initial place for robot first.\n").to_stdout
      end
    end

    context "Place robot" do
      it "place robot" do
        ui = RobotUI.new

        expect do
          ui.execute("PLACE 3,2,NORTH")
          ui.execute("REPORT")
        end.to output("3, 2, NORTH\n").to_stdout
      end
    end

    context "Place robot with invalid input" do
      it "reports invalid input" do
        ui = RobotUI.new

        expect do
          ui.execute("PLACE 0,2,NORTH")
          ui.execute("PLACE THREE,2,NORTH")
          ui.execute("PLACE 1,2.15,NORTH")
          ui.execute("PLACE 0,2,VERYNORTH")
          ui.execute("PLACE 0,2,SOUTH")
          ui.execute("REPORT")
        end.to output("Unknown command.\nUnknown command.\nInvalid place.\n0, 2, SOUTH\n").to_stdout
      end
    end

    context "Change place" do
      it "changes place" do
        ui = RobotUI.new

        expect do
          ui.execute("PLACE 0,0,EAST")
          ui.execute("PLACE 2,3,SOUTH")
          ui.execute("REPORT")
        end.to output("2, 3, SOUTH\n").to_stdout
      end
    end

    context "Invalid command" do
      it "Invalid command" do
        ui = RobotUI.new

        expect do
          ui.execute("PLACE 3,2,NORTH")
          ui.execute("TURNLEFT")
        end.to output("Unknown command.\n").to_stdout
      end
    end

    context "Test example 1" do
      it "Ends up at 3,3,NORTH" do
        ui = RobotUI.new

        expect do
          ui.execute("PLACE 1,2,EAST")
          ui.execute("MOVE")
          ui.execute("MOVE")
          ui.execute("LEFT")
          ui.execute("MOVE")
          ui.execute("REPORT")
        end.to output("3, 3, NORTH\n").to_stdout
      end
    end

    context "Test example 2" do
      it "Ends up at 0,1,NORTH" do
        ui = RobotUI.new

        expect do
          ui.execute("PLACE 0,0,NORTH")
          ui.execute("MOVE")
          ui.execute("REPORT")
        end.to output("0, 1, NORTH\n").to_stdout
      end
    end

    context "Test example 3" do
      it "Ends up at 0,0,WEST" do
        ui = RobotUI.new

        expect do
          ui.execute("PLACE 0,0,NORTH")
          ui.execute("LEFT")
          ui.execute("REPORT")
        end.to output("0, 0, WEST\n").to_stdout
      end
    end

  end

end
