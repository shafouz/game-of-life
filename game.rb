require "io/console"
require "./universe.rb"
require "./cell.rb"
require "./neighbor.rb"
require "./displayer.rb"

module Game
  def self.run
    uni = Universe.new
    cell = Cell.new(position: {x: 1, y: 1}, universe: uni, status: "alive")
    cell2 = Cell.new(position: {x: 1, y: 2}, universe: uni, status: "alive")
    cell3 = Cell.new(position: {x: 1, y: 3}, universe: uni, status: "alive")
    uni.generate
    uni.p_cells
    print uni.neighbor_references
  end
end

Game.run
