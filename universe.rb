require "./neighbor"
require "./randomizer"

class Universe
  include Randomizer
  attr_reader :cells, :neighbor_references

  def initialize
    @cells = Hash.new
    @neighbor_references = Hash.new # how many alive neighbors a cell have
    initial_generation
    @generation = 1
  end

  def generate
    @neighbor_references.transform_values! {|v| v = 0}
    add_neighbors
    check_neighbors
    apply_rules
    @generation += 1
  end

  def initial_generation
    #Randomizer
    randomize
  end

  def ppp
    if @generation == 9
      print "cell: #{cells[[3,4]].position}"
      puts " | reference: #{neighbor_references[[3,4]]}"
      print "cell: #{cells[[5,4]].position if cells[[5,4]]}"
      puts " | reference: #{neighbor_references[[5,4]]}"
    end
  end

  def add_neighbors
    cells.each_value do |cell|
      x = cell.x
      y = cell.y
      Neighbor.new(x: x, y: y, universe: self).add_neighbors
    end
  end

  def check_neighbors
    neighbor_references.clone.each_key do |position|
      x = position[0]
      y = position[1]
      Neighbor.new(x: x, y: y, universe: self).add_alive_neighbors
    end
  end

  def apply_rules
    tbd = Array.new
    neighbor_references.clone.each_pair do |position, value|
      x = position[0]
      y = position[1]
      cell = cells[[x,y]]
      if (value == 2 || value == 3) && (cell.instance_of? Cell)
      elsif (value == 3) && (cell.nil?)
        Cell.new(position: {x: x, y: y}, universe: self)
      else
        tbd << {x: x, y: y}
        #remove_cell(x: x, y: y)
      end
    end
    tbd.each do |cell|
      remove_cell(x: cell[:x], y: cell[:y])
    end
  end

  # inject dependency probably
  def add_reference(x, y)
    if neighbor_references[[x,y]]
      @neighbor_references[[x,y]] += 1 
    end
  end
  #

  def add_cell(cell)
    @cells[[cell.x,cell.y]] = cell
    @neighbor_references[[cell.x, cell.y]] = 0
  end

  def remove_cell(x: ,y: )
    cells.delete([x,y])
  end

  def pp_stuff
    neighbor_references.map {|k,v| puts "#{k} => #{v}"}
    cells.map {|k,v| puts "#{k} => #{v}"}
  end
end
