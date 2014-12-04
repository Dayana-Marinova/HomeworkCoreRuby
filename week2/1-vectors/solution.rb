class Vector2D
  attr_accessor :x, :y

  def self.e
    Vector2D.new(1, 0)
  end

  def self.j
    Vector2D.new(0, 1)
  end

  def initialize(x, y)
    @x, @y = x, y
  end

  def length
    [@x, @y].map { |element| element**2 }.reduce(:+)**0.5
  end

  alias_method :magnitude, :length

  def normalize
    [@x / length, @y / length]
  end

  def ==(other)
    @x == other.x && @y == other.y
  end

  def +(other)
    [@x + other.x, @y + other.y]
  end

  def -(other)
    [@x - other.x, @y - other.y ]
  end

  def *(scalar)
    scalar.class != Fixnum ? [@x * scalar.x, @y * scalar.y] : [@x * scalar, @y * scalar]
  end

  def /(scalar)
    scalar.class != Fixnum ? [@x / scalar.x, @y / scalar.y] : [@x / scalar, @y / scalar]
  end

  def to_s
    "[#{ @x }, #{ @y }]"
  end

  alias_method :inspect, :to_s
end


class Vector
  def initialize(*components)
    @components = []
    components.each { |element| @components << element }
  end

  def dimension
    @components.length
  end

  def length
    @components.map { |element| element**2 }.reduce(:+)**0.5
  end

  alias_method :magnitude, :length

  def normalize
    @components.map { |element| element / length }
  end

  def [](index)
    @components[index]
  end

  def []=(index, value)
    @components[index] = value
  end

  def ==(other)
    dimension == other.dimension ? dimension.times.all? { |index| self[index] == other[index] } : false
  end

  def +(other)
    dimension.times.map { |index| self[index] + other[index] } if dimension == other.dimension
  end

  def -(other)
    dimension.times.map { |index| self[index] - other[index] } if dimension == other.dimension
  end

  def *(other)
    if other.class != Fixnum
      dimension.times.map { |index| self[index] * other[index] } if dimension == other.dimension
    else
      @components.map { |element| element * other }
    end
  end

  def /(other)
    if other.class != Fixnum
      dimension.times.map { |index| self[index] / other[index] } if dimension == other.dimension
    else
      @components.map { |element| element / other }
    end
  end

  def to_s
    "#{@components}"
  end

  alias_method :inspect , :to_s
end