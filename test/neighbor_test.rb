require_relative "./minitest_helper"
require_relative "../neighbor"
require_relative "../cell"
require_relative "../universe"

class TestNeighbor < Minitest::Test
  def setup
    @uni = Universe.new
    @cell = Cell.new(position: {x: 1, y: 2}, status: "alive", universe: @uni)
    @neighbor = Neighbor.new(x: 1, y: 2, universe: @uni)
  end

  def test_add_references_length
    @neighbor.add_neighbors
    assert_equal 9, @uni.neighbor_references.length
  end

  def test_remove_references_length
    @neighbor.remove_neighbors
    assert_equal 9, @uni.neighbor_references.length
  end
end
