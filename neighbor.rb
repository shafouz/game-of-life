class Neighbor
  attr_reader :x, :y, :universe

  def initialize(x: ,y: ,universe:)
    @x = x
    @y = y
    @universe = universe
  end

  def add_neighbors
    loop_through_neighbors do |x, y|
      universe.add_reference(x, y)
    end
  end

  def remove_neighbors
    loop_through_neighbors do |x, y|
      universe.remove_reference(x, y)
    end
  end

  def live_neighbors
    initial_pos = [x, y]
    loop_through_neighbors do |x,y|
      if universe.cells[[x,y]]
        universe.add_reference(initial_pos[0], initial_pos[1])
      end
    end
  end

  private
  def loop_through_neighbors
    ((y-1)..(y+1)).each_with_index do |y, y_index|
      ((x-1)..(x+1)).each_with_index do |x, x_index|
        unless y_index == 1 && x_index == 1
          yield x, y
        end
      end
    end
  end
end
