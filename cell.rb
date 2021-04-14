require_relative "universe"

class Cell < Universe
  def initialize(position: , status: "dead")
    @position = position
    @status = status
    @alive_neighbors = 0
  end

  def position
    @position
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

  def status
    @status
  end

  def alive?
    @status == "alive"
  end

  def dead?
    @status == "dead"
  end

  def neighboor_check
    ((y-1)..(y+1)).each_with_index do |y, y_index|
      ((x-1)..(x+1)).each_with_index do |x, x_index|
        unless x_index == 1 && y_index == 1
          puts universe[x][y].status
        end
      end
    end
  end

  def alive_neighbors
    @alive_neighbors
  end

  def add_neighbor
    @alive_neighbors += 1
  end

  def rule_one(cell)
    cell if cell.alive? && (cell.neighbors == 2 || cell.neighbors == 3)
  end

  def rule_two(cell)
    cell.alive if cell.dead? && cell.neighbors == 3
  end

  def rule_three(cell)
    cell.dead
  end

end

o = Universe.new
o.generation_check
