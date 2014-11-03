require 'minitest/autorun'

require_relative 'solution'

class ArrayTest < Minitest::Unit::TestCase
  def test_to_hash
    assert_equal({one: 1, two: 2}, [[:one, 1], [:two, 2]].to_hash)
    assert_equal({one: 11, two: 2}, [[:one, 1], [:two, 2], [:one, 11]].to_hash)
  end

  def test_index_by
    assert_equal({'Coltrane' => 'John Coltrane', 'Davis' => 'Miles Davis' }, ['John Coltrane', 'Miles Davis'].index_by { |name| name.split(' ').last })
    assert_equal({"anegdot"=>"abc anegdot", "abc"=>"bca abc"}, ["abc anegdot", "bca abc"].index_by { |name| name.split(' ').last })
  end

  def test_occurences_count
    assert_equal({foo: 2, bar: 1}, [:foo, :bar, :foo].occurences_count)
    assert_equal({one: 2, two: 4, me: 1}, [:one, :two, :two, :one, :two, :me, :two].occurences_count)
    assert_equal({'a' => 3, 'b' => 2, 'c' => 1}, %w[a a b c b a].occurences_count)
  end

  def test_subarray_count
    assert_equal 2, [1, 2, 3, 2, 3, 1].subarray_count([2, 3])
    assert_equal 3, [1, 2, 2, 2, 2, 1].subarray_count([2, 2])
    assert_equal 3, [1, 1, 2, 2, 1, 1, 1].subarray_count([1, 1])
  end
end
