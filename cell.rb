
class Cell
  def initialize(position: , status: "dead")
    @position = position
    @status = status
    @alive_neighbors = 0
    @dead_neighbors = 0
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

  def alive_neighbors
    @alive_neighbors
  end

  def dead_neighbors
    @dead_neighbors
  end

  def add_dead_neighbors
    @dead_neighbors += 1
  end

  def add_alive_neighbor
    @alive_neighbors += 1
  end

  def rules(cell)
    if rule_one
      cell
    else if rule_two
      cell.alive
    else
      cell.dead
    end
  end

  def rule_one(cell)
    cell.alive? && (cell.neighbors == 2 || cell.neighbors == 3)
  end

  def rule_two(cell)
    cell.dead? && cell.neighbors == 3
  end
end

