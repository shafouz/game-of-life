module Randomizer
  def randomize(cells: 20, squared_space: 5)
    #21213213356
    seed = Random.new()
    new_cells = Array.new

    (1..cells).each do 
      new_cells << {x: seed.rand(squared_space), y: seed.rand(squared_space)}
    end

    new_cells.uniq!
    new_cells.map {|el| Cell.new(position: el, universe: self)}
  end
end
