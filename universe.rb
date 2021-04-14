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
    @alive_cells.each do |cell|
      cell.neighboor_check
    end
    # loop through all alive cells and neighboor cells
  end
end
