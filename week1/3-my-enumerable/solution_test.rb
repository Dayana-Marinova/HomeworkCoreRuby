require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test
  class Collection
    include MyEnumerable

    def initialize(*data)
      @data = data
    end

    def each(&block)
      @data.each(&block)
    end
  end

  def test_map
    collection = Collection.new(*1..5)

    assert_equal [2, 3, 4, 5, 6], collection.map(&:succ)
  end

  def test_filter
    collection = Collection.new(*1..10)

    assert_equal [1, 3, 5, 7, 9], collection.filter(&:odd?)
  end

  def test_reject
    collection = Collection.new(*1..10)

    assert_equal [1, 3, 5, 7, 9], collection.reject(&:even?)
  end

  def test_reduce
    collection = Collection.new(*1..10)

    assert_equal 55, collection.reduce(0) { |sum, n| sum + n }
  end

  def test_include?
    collection = Collection.new(*1..10)

    assert_equal true, collection.include?(5)
    assert_equal false, collection.include?(11)
  end

  def test_any?
    collection = Collection.new(*1..10)

    assert_equal true, collection.any? { |i| i == 7 }
    assert_equal false, collection.any? { |i| i < 0 }
  end

  def test_all?
    collection = Collection.new *1..10

    assert_equal true, collection.all? { |i| i < 11 }
    assert_equal false, collection.all? { |i| i > 5}
  end

  def test_each_cons
    collection = Collection.new *1..5

    assert_equal [[1, 2, 3], [2, 3, 4], [3, 4, 5]], collection.each_cons(3)
    assert_equal [[1, 2], [2, 3], [3, 4], [4, 5]], collection.each_cons(2)
  end

  def test_count
    collection = Collection.new *1..10

    assert_equal 1, collection.count(7)
    assert_equal 10, collection.count(11)
  end

  def test_group_by
    collection = Collection.new *1..10

    result = {1=>[1, 4, 7, 10], 2=>[2, 5, 8], 0=>[3, 6, 9]}
    result1 = {1=>[1, 3, 5, 7, 9], 0=>[2, 4, 6, 8, 10]}

    assert_equal result, collection.group_by { |i| i%3 }
    assert_equal result1, collection.group_by { |i| i%2 }
  end

  def test_size
    collection = Collection.new *1..10

    assert_equal 10, collection.size
  end

  def test_min
    collection = Collection.new *1..10
    collection1 = Collection.new 2, 2, 2, 1, 1, -11, 4, 4, 4, 4, - 1, -2, -10

    assert_equal 1, collection.min
    assert_equal -11, collection1.min
  end

  def test_min_by
    collection = Collection.new *%w(albatross dog horse)

    assert_equal "dog", collection.min_by { |x| x.length }
  end

  def test_max
    collection = Collection.new *1..10
    collection1 = Collection.new 2, 2, 2, 1, 1, -11, 4, 4, 4, 4, - 1, -2, -10

    assert_equal 10, collection.max
    assert_equal 4, collection1.max
  end

  def test_max_by
    collection = Collection.new *%w(albatross dog horse)

    assert_equal "albatross", collection.max_by { |x| x.length }
  end

  def test_minmax
    collection = Collection.new *1..10
    collection1 = Collection.new 2, 2, 2, 1, 1, -11, 4, 4, 4, 4, - 1, -2, -10

    assert_equal [1, 10], collection.minmax
    assert_equal [-11, 4], collection1.minmax
  end

  def test_minmax_by
    collection = Collection.new *%w(albatross dog horse)

    assert_equal ["dog", "albatross"], collection.minmax_by { |x| x.length }
  end

  def test_take
    collection = Collection.new *1..10
    collection1 = Collection.new 2, 2, 2, 1, 1, -11, 4, 4, 4, 4, - 1, -2, -10

    assert_equal [1, 2, 3], collection.take(3)
    assert_equal [2, 2, 2], collection1.take(3)
  end

  def test_take_while
    collection = Collection.new *1..10
    collection1 = Collection.new 2, 2, 2, 1, 1, -11, 4, 4, 4, 4, - 1, -2, -10

    assert_equal [1, 2, 3], collection.take_while { |i| i < 4 }
    assert_equal [-11, -1, -2, -10], collection1.take_while { |i| i < 0 }
  end

  def test_drop
    collection = Collection.new *1..10
    collection1 = Collection.new 2, 2, 2, 1, 1, -11, 4, 4, 4, 4, - 1, -2, -10

    assert_equal [4, 5, 6, 7, 8, 9, 10], collection.drop(3)
    assert_equal [1, 1, -11, 4, 4, 4, 4, - 1, -2, -10], collection1.drop(3)
  end

  def test_drop_while
    collection = Collection.new *1..10
    collection1 = Collection.new 2, 2, 2, 1, 1, -11, 4, 4, 4, 4, - 1, -2, -10

    assert_equal [3, 4, 5, 6, 7, 8, 9, 10], collection.drop_while { |i| i < 3}
    assert_equal [4, 4, 4, 4], collection1.drop_while { |i| i < 3}
  end
end
