require_relative "./minitest_helper"
require_relative "../game"

class TestGame < Minitest::Test
  def setup
    @cell = Cell.new(position: {x: 1, y: 2})
  end
end
