require "./universe.rb"
require "./cell.rb"
require "./neighbor.rb"
require "./displayer.rb"
require "pry"

module Game
  def self.run
    uni = Universe.new
    display = Displayer.new
    while true
      uni.generate
      display.display(uni.cells)
    end
  end
end

Game.run

