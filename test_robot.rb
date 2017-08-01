require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    @robot = Robot.new
    @robot.needs_repairs = true
    @robot.foreign_model = true
    # act

    # assert
    assert_equal(@robot.station, 1)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    @robot = Robot.new
    @robot.vintage_model = true
    @robot.needs_repairs = true

    assert_equal(@robot.station, 2)
    # arrange

    # act

    # assert
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    @robot = Robot.new
    @robot.needs_repairs = true

    assert_equal(@robot.station, 3)
    # arrange

    # act

    # assert
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    @robot = Robot.new

    assert_equal(@robot.station, 4)
    # arrange

    # act

    # assert
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    @robot = Robot.new
    @robot.todos = []

    assert_equal(-1, @robot.prioritize_tasks)
    # arrange

    # act

    # assert
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    @robot.Robot.new
    @robot.todos= [1,2]
    # arrange

    # act
    assert_equal(@robot.todos.max,@robot.prioritize_tasks)
    # assert
  end

  def test_workday_on_day_off_returns_false
    @robot = Robot.new
    robots_day_off = @robot.day_off = 'sunday'

    assert_equal false, @robot.workday?(robots_day_off)

  end

  def test_workday_not_day_off_returns_true
    @robot = Robot.new
    day_off = @robot.day_off = 'sunday'
    work_day = @robot.workday?('monday')


    assert_equal true, @robot.workday?(work_day)
    # arrange

    # act

    # assert
  end

end
