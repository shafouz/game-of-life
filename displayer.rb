module Displayer
  def self.display(hash)
    while true
      sleep 1
      puts `clear`
      generation = 1
      50.times { print " " }

      print_hash(hash)

      print_footer(generation)
    end
  end

  private
  def self.print_hash(hash)
    hash.each_value do |value|
      if value.alive?
        print "o"
      else
        print "."
      end
    end
  end

  def self.print_footer(generation)
    160.times { print " " }
    print generation
  end
end

