require "./universe"
require "./neighbor"

class Cell
  attr_reader :position, :status, :universe

  def initialize(position: , status: "alive", universe:)
    @position = position
    @status = status
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
