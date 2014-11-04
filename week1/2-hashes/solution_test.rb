require 'minitest/autorun'

require_relative 'solution'

class HashTest < Minitest::Test
  def test_pick
    assert_equal({:a=>1, :b=>2}, {a: 1, b: 2, c: 3}.pick(:a, :b))
    assert_equal({:a=>1}, {a: 1, b: 2, c: 3}.pick(:a))
  end

  def test_except
    assert_equal({:a=>1},  {a: 1, b: 2, d: nil}.except(:d, :b))
    assert_equal({:a=>1, :b=>2}, {a: 1, b: 2, d: nil}.except(:d))
  end

  def test_compact_values
    assert_equal({:a=>1, :b=>2}, {a: 1, b: 2, c: false, d: nil}.compact_values) 
  end

  def test_defaults
    assert_equal({:a=>1, :b=>2, :c=>3}, {a: 1, b: 2}.defaults(a: 4, c: 3))
  end

  def test_pick!
    hash = {a: 1, b: 2, c: 3}
    hash.pick!(:a, :b)
    assert_equal({:a=>1, :b=>2}, hash)
  end

  def test_except!
    hash = {a: 1, b: 2, d: nil}
    hash.except!(:d)
    assert_equal({:a=>1, :b=>2}, hash)
  end

  def test_compact_values!
    hash = {a: 1, b: 2, c: false, d: nil}
    hash.compact_values!
    assert_equal({:a=>1, :b=>2}, hash)
  end

  def test_defaults!
    hash = {a: 1, b: 2}
    hash.defaults!(a: 4, c: 3)
    assert_equal({:a=>1, :b=>2, :c=>3}, hash)
  end
end
