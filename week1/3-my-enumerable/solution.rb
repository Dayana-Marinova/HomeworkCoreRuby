module MyEnumerable
  def map
    [].tap { |result| each { |element| result << yield(element) } }
  end

  def filter
    [].tap { |result| each { |element| result << element if yield(element) } }
  end

  def reject
    [].tap{ |result| each{ |element| result << element if not yield(element)} }
  end

  def reduce(initial = nil , &block)
    each { |element| initial = block.call(initial, element) }
    initial
  end

  def any?
    each { |element| return true if yield(element) }
    false
  end

  def all?
    each { |element| return false if not yield(element) }
    true
  end

  def each_cons(n)

  end

  def include?(element)
    # Your code goes here.
  end

  def count(element = nil)
    # Your code goes here.
  end

  def size
    # Your code goes here.
  end
end

class Collection
  include MyEnumerable

  def initialize(*data)
    @data = data
  end

  def each(&block)
    @data.each(&block)
  end
end

coll = Collection.new(*(1..10))
#p coll.map { |i| i*2 }
#p coll.filter { |i| i > 4 }
#p coll.reject { |i| i > 4 }
#p coll.reduce(0) { |sum, i| sum + i }
#p coll.any? { |i| i == 7 }
#p coll.all? { |i| i < 11 }
p