require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test
  def test_length
    vector = Vector2D.new(1, 0)
    vector1 = Vector2D.new(3, 4)

    assert_equal 1, vector.length
    assert_equal 5, vector1.length
  end

  def test_magnitude
    vector = Vector2D.new(1, 0)
    vector1 = Vector2D.new(3, 4)

    assert_equal 1, vector.magnitude
    assert_equal 5, vector1.magnitude
  end

  def test_normalize
    vector = Vector2D.new(1, 0)
    vector1 = Vector2D.new(3, 4)

    assert_equal [1, 0], vector.normalize
    assert_equal [3 / vector1.length, 4 / vector1.length], vector1.normalize
  end

  def test_equals
    vector = Vector2D.new(1, 0)
    vector1 = Vector2D.new(3, 4)
    vector2 = Vector2D.new(1, 0)
    vector3 = Vector2D.new(4, 3)

    assert_equal true, vector == vector2
    assert_equal false, vector1 == vector3
  end

  def test_collectable
    vector = Vector2D.new(1, 0)
    vector1 = Vector2D.new(3, 4)

    assert_equal [4, 4], vector + vector1
  end

  def test_subtraction
    vector = Vector2D.new(1, 0)
    vector1 = Vector2D.new(3, 4)

    assert_equal [-2, -4], vector - vector1
    assert_equal [2, 4], vector1 - vector
  end

  def test_multiplication
    vector = Vector2D.new(1, 1)
    vector1 = Vector2D.new(3, 4)
    scalar = 2

    assert_equal [3, 4], vector.*(vector1)
    assert_equal [2, 2], vector * scalar
  end

  def test_partition
    vector = Vector2D.new(1, 1)
    vector1 = Vector2D.new(3, 4)
    scalar = 2

    assert_equal [1 / 2, 1 / 2], vector / scalar
    assert_equal [1 / 3, 1 / 4], vector / vector1
  end

  def test_to_s
    vector = Vector2D.new(1, 1)
    vector1 = Vector2D.new(3, 4)

    assert_equal "[1, 1]", vector.to_s
    assert_equal "[3, 4]", vector1.to_s
  end

  def test_inspect
    vector = Vector2D.new(1, 1)
    vector1 = Vector2D.new(3, 4)

    assert_equal "[1, 1]", vector.inspect
    assert_equal "[3, 4]", vector1.inspect
  end

  def test_dimension_vector
    vector = Vector.new(1, 2, 3, 4, 5, 6)
    vector1 = Vector.new(1, 2, 3, 4)

    assert_equal 6, vector.dimension
    assert_equal 4, vector1.dimension
  end

  def test_length_vector
    vector = Vector.new(1, 1, 1, 2, 3)
    vector1 = Vector.new(1, 1, 1, 1)

    assert_equal 4, vector.length
    assert_equal 2, vector1.length
  end

  def test_magnitude_vector
    vector = Vector.new(1, 1, 1, 2, 3)
    vector1 = Vector.new(1, 1, 1, 1)

    assert_equal 4, vector.magnitude
    assert_equal 2, vector1.magnitude
  end

  def test_normalize_vector
    vector = Vector.new(1, 1, 1, 2, 3)
    vector1 = Vector.new(1, 1, 1, 1)

    assert_equal [0.25, 0.25, 0.25, 0.5, 0.75], vector.normalize
    assert_equal [0.5, 0.5, 0.5, 0.5], vector1.normalize
  end

  def test_brackets_vector
    vector = Vector.new(1, 1, 1, 2, 3)
    vector1 = Vector.new(2, 1, 2, 1)

    assert_equal 1, vector[1]
    assert_equal 1, vector[2]
    assert_equal 2, vector[3]

    assert_equal 1, vector1[1]
    assert_equal 2, vector1[2]
  end

  def test_equals_vector
    vector = Vector.new(1, 1, 1, 2, 3)
    vector1 = Vector.new(2, 1, 2, 1)
    vector2 = Vector.new(1, 1, 1, 2, 3)
    vector3 = Vector.new(2, 2, 2, 1)

    assert_equal false, vector1 == vector3
    assert_equal false, vector == vector1
    assert_equal true, vector == vector2
  end

  def test_modified_vector
    vector = Vector.new(1, 1, 1, 2, 3)
    vector1 = Vector.new(2, 1, 2, 1)
    vector[2]= 2
    vector1[4]= 2

    assert_equal true, vector == Vector.new(1, 1, 2, 2, 3)
    assert_equal true, vector1 == Vector.new(2, 1, 2, 1, 2)
  end

  def test_collectable_vector
    vector = Vector.new(1, 1, 1, 2, 3)
    vector1 = Vector.new(2, 1, 2, 1)
    vector2 = Vector.new(1, 1, 1, 2, 3)

    assert_equal nil, vector + vector1
    assert_equal [2, 2, 2, 4, 6], vector + vector2
  end

  def test_subtraction_vector
    vector = Vector.new(1, 1, 1, 2, 3)
    vector1 = Vector.new(2, 1, 2, 1)
    vector2 = Vector.new(1, 1, 1, 2, 3)

    assert_equal nil, vector - vector1
    assert_equal [0, 0, 0, 0, 0], vector - vector2
  end

  def test_multiplication_vector
    vector1 = Vector.new(1, 1, 1, 2, 3)
    vector2 = Vector.new(1, 1, 1, 2, 3)
    vector3 = Vector.new(2, 1, 2, 1)
    scalar = 2

    assert_equal [2, 2, 2, 4, 6], vector1 * scalar
    assert_equal [1, 1, 1, 4, 9], vector1 * vector2
    assert_equal nil, vector1 * vector3
  end

  def test_artition_vector
    vector1 = Vector.new(1, 1, 1, 2, 3)
    vector2 = Vector.new(1, 1, 1, 2, 3)
    vector3 = Vector.new(2, 1, 2, 1)
    scalar = 2

    assert_equal [1 / 2, 1 / 2, 1 / 2, 1, 3 / 2], vector1 / scalar
    assert_equal [1, 1, 1, 1, 1], vector1 / vector2
    assert_equal nil, vector1 / vector3
  end

  def test_to_s_vector
    vector2 = Vector.new(1, 1, 1, 2, 3)
    vector3 = Vector.new(2, 1, 2, 1)

    assert_equal "[1, 1, 1, 2, 3]", vector2.to_s
    assert_equal "[2, 1, 2, 1]", vector3.to_s
  end

  def test_inspect_vector
    vector2 = Vector.new(1, 1, 1, 2, 3)
    vector3 = Vector.new(2, 1, 2, 1)

    assert_equal "[1, 1, 1, 2, 3]", vector2.inspect
    assert_equal "[2, 1, 2, 1]", vector3.inspect
  end
end
