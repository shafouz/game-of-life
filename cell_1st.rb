require "./universe"

class Cell
  attr_reader :position, :status, :universe, :neighbors

  def initialize(position: , status: "dead", universe:)
    @position = position
    @status = status
    @universe = universe
    @neighbors = { alive: 0, dead: 0, all: Array.new }
    universe.add_cell(self)
  end

  def prepare_neighbors
    find_neighbors
    #check_neighbors
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

  def loop_through_neighbors
    ((y-1)..(y+1)).each_with_index do |y, y_index|
      ((x-1)..(x+1)).each_with_index do |x, x_index|
        unless y_index == 1 && x_index == 1
          yield x, y
        end
      end
    end
  end

  def find_neighbors
    loop_through_neighbors do |x,y|
      if universe.cell_exists?(x: x, y: y)
        @neighbors[:alive] += 1
      else
        @neighbors[:dead] += 1
      end
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
