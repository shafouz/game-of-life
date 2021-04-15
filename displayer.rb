module Displayer
  def self.display(array)
    while true
      sleep 1
      puts `clear`
      generation = 1

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

      160.times { print " " }
      print generation
    end
  end
end

