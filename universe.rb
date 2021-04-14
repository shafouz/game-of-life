require "./neighbor"
require "./cell"

class Universe
  # 0 -> 29 | X
  # 0 -> 167 | Y

  def initialize
    @universe = Array.new(rows) { |x| Array.new(cols) {|y| Cell.new(position: { x: x, y: y })}}
    @alive_cells = [
      @universe[14][84],
      @universe[15][85],
      @universe[16][83],
      @universe[16][84],
      @universe[16][85],
    ]
  end

  def universe
    @universe
  end

  def cols
    @cols = 168
  end

  def rows
    @rows = 30
  end

  def generation_check
  end

  def check_neighbors(cell)
    neighbors = find_neighbors(cell)
    neighbors.each do |neighbor|
      if neighbor.alive?
        cell.add_dead_neighbors
      else
        cell.add_dead_neighbors
      end
    end
  end

  def find_neighbors(cell)
    neighbors = []
    ((cell.y-1)..(cell.y+1)).each_with_index do |y, y_index|
      ((cell.x-1)..(cell.x+1)).each_with_index do |x, x_index|
        unless y_index == 1 && x_index == 1
          neighbors << universe[x][y]
        end
      end
    end
    neighbors
  end
end

puts Universe.new.find_neighbors(Cell.new(position: {x: 10, y: 123}))
