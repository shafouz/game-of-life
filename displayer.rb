class Displayer
  attr_reader :x_offset, :y_offset, :generation

  def initialize
    @generation = 1
    @x_offset = 84
    @y_offset = 18
  end

  def display(hash)
    hash = set_offset(hash)
    print_hash(hash)
    print_footer
    reset_terminal
  end

  private
  def print_hash(hash)
    (1..40).each do |y|
      (1..168).each do |x|
        if hash.key?([x,y])
          print "x"
          #print "|#{x - 84},#{y - 18}|"
        else
          print "."
        end
      end
      puts
    end
  end

  def print_footer
    gen = "generation: #{generation}"
    (168 - gen.length).times { print " " }
    print gen
    @generation += 1
  end

  def set_offset(hash)
    offset_hash = Hash.new
    hash.map { |key, value| offset_hash[[key[0] + x_offset, key[1] + y_offset]] = 0 }
    offset_hash
  end

  def reset_terminal
    sleep 0.25
    puts `clear`
  end
end

