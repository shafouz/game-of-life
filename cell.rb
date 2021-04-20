require "./universe"
require "./neighbor"

class Cell
  attr_reader :position, :universe

  def initialize(position:, universe:)
    @position = position
    @universe = universe
    universe.add_cell(self)
  end

  def y
    @position[:y]
  end

  def x
    @position[:x]
  end
end
