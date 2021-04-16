require "./universe"

class Cell
  attr_reader :position, :status, :universe

  def initialize(position: , status: "dead", universe:)
    @position = position
    @status = status
    @universe = universe
    check_neighbors
    universe.add_cell(self)
  end

  def loop_through_neighbors
    ((y-1)..(y+1)).each_with_index do |y, y_index|
      ((x-1)..(x+1)).each_with_index do |x, x_index|
        unless y_index == 1 && x_index == 1
          yield x, y
        end
      end
    end
  end

  def check_neighbors
    loop_through_neighbors do |x, y|
      universe.add_reference(x, y)
    end
  end

  def y
    @position[:y]
  end

  def x
    @position[:x]
  end

  def alive
    @status = "alive"
  end

  def dead
    @status = "dead"
  end

  def alive?
    @status == "alive"
  end

  def dead?
    @status == "dead"
  end
end

uni = Universe.new
cell = Cell.new(position: {x:1, y:2}, universe: uni)
cell2 = Cell.new(position: {x:1, y:3}, universe: uni)
puts uni.neighbor_references
puts uni.cells
