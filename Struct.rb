class Struct
  @children = []

  class << self
    attr_reader :children
    def inherited(child) 
      puts "A new child class is born" + child.inspect
      @children << child
    end
  end
end


Dave = Struct.new(:x)
Fred = Struct.new(:x)

p Struct.children

