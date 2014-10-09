require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Unit::TestCase
  def test_histogram
    assert_equal histogram("abra"), {"a" => 2, "b" => 1, "r" => 1}
  end
  def test_prime
  	assert_equal prime?(3), true
  	assert_equal prime?(42), false
  end
  def test_ordinal
  	assert_equal ordinal(2), "2nd"
  	assert_equal ordinal(112), "112th"
  	assert_equal ordinal(103), "103rd"
  	assert_equal ordinal(31), "31st"
  	assert_equal ordinal(523), "523rd"
  end
  def test_palindrome
  	assert_equal palindrome?(1221), true
  	assert_equal palindrome?("Race car"), true
  	assert_equal palindrome?(1234), false
  	assert_equal palindrome?("raCe Cer"), false
  end
  def test_anagram
  	assert_equal anagram?('silent', 'listen'), true
  	assert_equal anagram?('Mr Mojo Risin', 'Jim Morisson'), false
  end
  def test_remove_prefix
  	assert_equal remove_prefix('Ladies Night Out', 'Ladies'), "Night Out"
  	assert_equal remove_prefix('KKKKKKKK', "K"), ""
  end
  def test_remove_suffix
  	assert_equal remove_suffix('Ladies Night Out', 'Night Out'), "Ladies"
  	assert_equal remove_suffix("KKKKKKKK XXXXXX abc", "XXXXXX abc"), "KKKKKKKK"
  end
  def test_digits
  	assert_equal digits(123), [1, 2, 3]
  	assert_equal digits(12345), [1, 2, 3, 4, 5]
  end
  def test_fizzbuzz
  	assert_equal fizzbuzz(1..7), [1, 2, "fizz", 4, "buzz", "fizz", 7]
  	#true ? :return_this : :return_this
  	assert_equal fizzbuzz(1..15), [1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz", 11, "fizz", 13, 14, "fizzbuzz"]
  end
  def test_kth_factorial
  	assert_equal kth_factorial(1, 10), 3628800
  	assert_equal kth_factorial(1, 9), 3628800 / 10
  end
  def test_count
  	assert_equal count([1, 2, 1, 3]), {1=>2, 2=>1, 3=>1}
  end
  def test_count_words
  	assert_equal count_words("This is a sentence, bro.", "Bro, this is it."), 
  		{"this"=>2, "is"=>2, "a"=>1, "sentence"=>1, "bro"=>2, "it"=>1}
  end
end
