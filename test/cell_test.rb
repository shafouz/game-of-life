require_relative "./minitest_helper"
require_relative "../cell"

class TestCell < Minitest::Test
  def setup
    @cell = Cell.new(position: {x: 1, y: 2})
  end

  def test_cell_position
    assert_equal({x: 1, y: 2}, @cell.position)
  end

  def test_cell_x
    assert_equal 1, @cell.x
  end

  def test_cell_y
    assert_equal 2, @cell.y
  end

  def test_alive
    assert_equal "alive", @cell.alive
  end

  def test_status
    assert_equal "dead", @cell.status
  end

  def test_dead
    assert_equal "dead", @cell.dead
  end

  def test_alive?
    assert_equal false, @cell.alive?
  end

  def test_dead?
    assert_equal true, @cell.dead?
  end
end
