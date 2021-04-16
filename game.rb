require "io/console"
require "./universe.rb"
require "./cell.rb"
require "./displayer.rb"

module Game
  def self.run
  end
end

uni = Universe.new
cell = Cell.new(status: "alive", position: {x:3,y:1}, universe: uni)
#puts uni.cells
uni.generate
