class Triangle
  # write code here

  attr_accessor :type

  def initialize(length1, length2, length3)
    sides = [length1, length2, length3]
    sides.each.with_index do |s, i|
      if((sides[(i+1)%3] + sides[(i+2)%3]) <= s)
        raise TriangleError
      end
    end

    if(!!sides.find { |s| s <=0 })
      raise TriangleError
    end

    if(sides.uniq.length == 1)
      @type = "equilateral"
    elsif(sides.uniq.length == 2)
      @type = "isosceles"
    else
      @type = "scalene"
    end
  end

  def kind
    type.to_sym
  end

  class TriangleError < StandardError
    def message
    end
  end

end

t1 = Triangle.new(20,23,12)
t2 = Triangle.new(6,6,9)
t3 = Triangle.new(12,12,12)
