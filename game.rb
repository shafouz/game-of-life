require "io/console"
require_relative "cell"

class Game
end

module Displayer
  def self.display(array)
    array.each do |array2|
      array2.each do |cell|
        if cell.alive?
          print "o"
        else
          print "."
        end
      end
      puts ""
    end
  end
end

class Universe
  # 0 -> 29 | X
  # 0 -> 167 | Y

  def initialize
    @universe = Array.new(rows) { |x| Array.new(cols) {|y| Cell.new(position: { x: x, y: y })}}
    initial_pattern
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

  def initial_pattern
    @universe[14][84].alive
    @universe[15][85].alive
    @universe[16][83].alive
    @universe[16][84].alive
    @universe[16][85].alive
  end
end

#puts IO.console.winsize
#Universe.new

Displayer.display(Universe.new.universe)

# assuming loop = 168
#1a[131] a[132] a[133]
#2a[131] a[132] a[133]
#3a[131] a[132] a[133]
