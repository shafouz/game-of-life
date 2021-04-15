class Universe
  attr_reader :universe

  def initialize
    @universe = Hash.new
  end

  def add_cell(cell)
    @universe[[cell.x,cell.y]] = cell
  end

  def cell_exists?(x: , y:)
    universe[[x, y]].nil?
  end
end
