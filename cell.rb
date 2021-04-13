class Cell
  def initialize(position:, status: "empty")
    @position = position
    @status = status
  end

  def position
    @position
  end

  def y
    cell_position[:y]
  end

  def x
    cell_position[:x]
  end

  def alive
    @status = "alive"
  end

  def dead
    @status = "dead"
  end

  def empty
    @status = "empty"
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
  end

  def neighboor_check
    ((y-1)..(y+1)).each_with_index do |y, y_index|
      ((x-1)..(x+1)).each_with_index do |x, x_index|
        unless x_index == 1 && y_index == 1
        end
      end
    end
  end

  def rule_one
    cell.dead if alive? && neighbors < 2
  end

  def rule_two
    cell.dead if alive? && neighbors > 3
  end

  def rule_three
    cell.alive if dead? && neighbors == 3
  end

  def rule_four
    cell if alive? && (neighbors == 2 || neighbors == 3)
  end
end
