# Universe starts with a pattern
# Universe goes through every instance of Cell
# Universe asks Neighbor how many alive/dead neighbors a cell has
# Universe applies its rules
# Universe creates/destroy based on the rules

class Neighbor
  attr_reader :cell, :universe, :neighbors

  def initialize(cell:, universe:)
    @cell = cell
    @universe = universe
    @neighbors = { alive: 0, dead: 0, all: Array.new }
  end

  def check_cell
    find_neighbors
  end

  def alive_neighbors
    @neighbors[:alive]
  end

  def dead_neighbors
    @neighbors[:dead]
  end

  def add_alive_neighbor
    @neighbors[:alive] += 1
  end

  def add_dead_neighbor
    @neighbors[:dead] += 1
  end

  def check_neighbors
    neighbors[:all].each do |neighbor|
      if neighbor.alive?
        add_alive_neighbor
      else
        add_dead_neighbor
      end
    end
  end

  def find_neighbors
    loop_through_neighbors do |x,y|
      if universe.cell_exists?(x: x, y: y)
        @neighbors[:all] << universe[[x,y]]
      end
    end
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

end
