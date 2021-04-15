require "./cell.rb"

class Neighbor < Cell
  def initialize(cell)
    @cell = cell
  end

  def cell
    @cell
  end

  def neighbors
  end

  def check_neighbors
    neighbors = find_neighbors(cell)
    neighbors.each do |neighbor|
      if neighbor.alive?
        cell.add_dead_neighbors
      else
        cell.add_dead_neighbors
      end
    end
  end

end
