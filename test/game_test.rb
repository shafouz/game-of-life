require_relative "./minitest_helper"
require_relative "../game"

class TestGame < Minitest::Test
  def setup
    @uni = Universe.new
  end

  def test_generate
    @uni.generate
    assert_equal 3, @uni.cells.length
    assert_equal true, @uni.cells.has_key?([0,2])
    assert_equal true, @uni.cells.has_key?([1,2])
    assert_equal true, @uni.cells.has_key?([2,2])
    @uni.generate
    assert_equal 3, @uni.cells.length
    assert_equal true, @uni.cells.has_key?([1,1])
    assert_equal true, @uni.cells.has_key?([1,2])
    assert_equal true, @uni.cells.has_key?([1,3])
    @uni.generate
    assert_equal 3, @uni.cells.length
    assert_equal true, @uni.cells.has_key?([0,2])
    assert_equal true, @uni.cells.has_key?([1,2])
    assert_equal true, @uni.cells.has_key?([2,2])
    @uni.generate
    assert_equal 3, @uni.cells.length
    assert_equal true, @uni.cells.has_key?([1,1])
    assert_equal true, @uni.cells.has_key?([1,2])
    assert_equal true, @uni.cells.has_key?([1,3])
  end
end
