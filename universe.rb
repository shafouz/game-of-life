require "./neighbor"

class Universe
  attr_reader :cells, :neighbor_references

  def initialize
    @cells = Hash.new
    # @references[[cell.pos]] = number of references from alive cells
    # when a cell is created, it checks every neighbor and adds it to references 
    # unless it already exists then it just adds 1 to that reference 
    # ^^^^^^ Done ^^^^^^
    # if any reference has exactly 3 references 
    ## if it doesnt exist
    # a Cell.new(position: cell.pos, universe: self, status: alive) is created and appended to @cells 
    # everything gets destroyed unless it has between 2 and 3 references 
    @neighbor_references = Hash.new # how many alive neighbors a cell have
  end

  def generate
    # initial_generation
    initial_generation
    # tell neighbor to check cell neighbors to prepare its neighbors
    add_neighbors
    #transform_cells
    check_neighbors
  end

  def initial_generation
  end

  def add_neighbors
    cells.each_value do |cell|
      x = cell.x
      y = cell.y
      Neighbor.new(x: x, y: y, universe: self).add_neighbors
    end
  end

  def check_neighbors
    neighbor_references.each_key do |position|
      x = position[0]
      y = position[1]
      Neighbor.new(x: x, y: y, universe: self).live_neighbors
    end
  end

  def apply_rules
    neighbor_references.each_pair do |position, neighbor|
    end
  end

  def transform_cells
    neighbor_references.clone.each_pair do |position, neighbor|
      x = position[0]
      y = position[1]
      if (neighbor == 2 || neighbor == 3) && (cell_exists? x: x, y: y)
        puts "got here"
      elsif neighbor == 3 && !(cell_exists? x: x, y: y) 
        Cell.new(position: {x: x, y: y}, universe: self, status: "alive") 
      else
        if (cell_exists? x: x, y: y)
          remove_cell(x, y)
          @cells.delete([x, y])
        else
          remove_cell(x, y)
        end
      end
    end
  end

  # inject dependency probably
  def add_reference(x, y)
    if neighbor_references[[x,y]]
      @neighbor_references[[x,y]] += 1 
    else
      @neighbor_references[[x,y]] = 0
    end
  end

  def remove_reference(x, y)
    if neighbor_references[[x,y]]
      @neighbor_references[[x,y]] -= 1
    end
  end
  #

  def add_cell(cell)
    @cells[[cell.x,cell.y]] = cell
    @neighbor_references[[cell.x, cell.y]] = 0
  end

  def remove_cell(x,y)
    Neighbor.new(x: x, y: y, universe: self).remove_neighbors
    remove_reference(x,y)
  end

  def cell_exists?(x: , y: )
    !(@cells[[x,y]].nil?)
  end

  def p_cells
    cells.each_value do |cell|
      puts cell.position
      puts neighbor_references[[cell.x, cell.y]]
    end
  end
end

