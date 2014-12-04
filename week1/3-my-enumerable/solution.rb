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
    result = []
    each { |element| result << (element..element+(n-1)).to_a if element < size-n+2 }
    result
  end

  def include?(element)
    (filter { |el| el == element }).size > 0 ? true : false
  end

  def count(element = nil)
    result = (filter { |i| i == element }).size
    result > 0 ? result : size
  end

  def size
    reduce(0) { |sum, element| sum + 1 }
  end

  def group_by
    result = {}
    each { |element| result[yield(element)] ||= [] }
    each { |element| result[yield(element)] << element}
    result
  end

  def min
    min_by
  end

  def min_by
    min = "9999999999999999999999999999999999999999999999999999999999999999999"
    if block_given?
      each { |i| min = i if yield(i) < yield(min) }
    else
      each { |i| min = i if min.to_i > i }
    end
    min
  end

  def max
    max_by
  end

  def max_by
    max = ""
    if block_given?
      each { |i| max = i if yield(i) > yield(max) }
    else
      each { |i| max = i if max.to_i < i }
    end
    max
  end

  def minmax
    minmax_by
  end

  def minmax_by(&block)
    [min_by(&block), max_by(&block)]
  end

  def take(n)
    result = []
    each { |i| result << i if result.size < n }
    result
  end

  def take_while
    result = []
    each { |i| result << i if yield(i) }
    result
  end

  def drop(n)
    each.to_a.reverse.take(size - n).reverse
  end

  def drop_while
    result = []
    each { |i| result << i unless yield(i) }
    result
  end
end