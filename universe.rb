require "./neighbor"

class Universe
  attr_reader :cells, :neighbor_references

  def initialize
    @cells = Hash.new
    # @references[[cell.pos]] = number of references from alive cells
    # when a cell is created, it checks every neighbor and adds it to references 
    # unless it already exists then it just adds 1 to that reference 
    # if any reference has exactly 3 references 
    # if it doesnt exist
    # a Cell.new(position: cell.pos, universe: self, status: alive) is created and appended to @cells 
    # everything gets destroyed unless it has between 2 and 3 references 
    @neighbor_references = Hash.new 
  end

  def generate
    # initial_generation
    initial_generation
    # tell neighbor to check cell neighbors to prepare its neighbors
    prepare_cells
  end

  def add_reference(x, y)
    if @neighbor_references[[x,y]]
      @neighbor_references[[x,y]] += 1 
    else
      @neighbor_references[[x,y]] = 1
    end
  end

  def initial_generation
  end

  def prepare_cells
    cells.each_value do |cell|
      rules(cell)
    end 
  end

  def add_cell(cell)
    @cells[[cell.x,cell.y]] = cell
  end

  def cell_exists?(x: , y:)
    !(cells[[x, y]].nil?)
  end

  private
  def rules(cell)
    if rule_one(cell)
      cell
    elsif rule_two(cell)
      Cell.new(universe: self, status: 1)
    else
      rule_three(cell)
    end
  end

  def rule_one(cell)
    cell.exists? cell.x, cell.y && (cell.neighbors[:alive] == 2 || cell.neighbors[:alive] == 3)
  end

  def rule_two(cell)
  end

  def rule_three(cell)
    cell.dead
  end
end


