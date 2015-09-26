require_relative "isbn.rb"
require "minitest/autorun"

class Isbn_test < Minitest::Test

	def test_to_remove_dashes_and_spaces
	assert_equal("1234567890", check_for_space_or_dash("123-4567-890"))
	assert_equal("1234567890", check_for_space_or_dash("123 4567 890"))
	end
	
	def test_for_correct_number_of_characters_10
	assert_equal(true, check_number_length("1234567890"))
	assert_equal(false, check_number_length("12345678901"))
	end
	
	def test_for_correct_number_of_characters_13
	assert_equal(true, check_number_length("1234567890123"))
	assert_equal(false, check_number_length("12345678901"))
	end
	
	def test_for_replacement_of_x
	assert_equal(["0","8","0","4","4","2","9","5","7","10"], check_digit_contains_X(["0","8","0","4","4","2","9","5","7","x"]))
	assert_equal(["0","8","0","4","4","2","9","5","7","8"], check_digit_contains_X(["0","8","0","4","4","2","9","5","7","8"]))
	end
	
	def test_for_only_numeric_characters
	assert_equal(nil, only_numeric_characters(["1","2","3","4","5","6","7","8","9","0"]))
	assert_equal(true, only_numeric_characters(["1","2","3","x","5","6","7","8","9","0"]))
	end
	
	def test_for_10_digit_math
	assert_equal(true, check_digit_valid_10(["0","3","0","6","4","0","6","1","5","2"]))
	#assert_equal(false, check_digit_valid_10("0804429578"))
	end
	
	def test_for_thirteen_character_math
    assert_equal(true, check_digit_valid_13(["9","7","8","0","1","5","6","0","2","7","3","2","8"]))
    #assert_equal(false, check_digit_valid_13("780670020485"))
    #assert_equal(false, check_digit_valid_13("134567891111"))
	#assert_equal(true, check_digit_valid_13("9780306406157"))
	#assert_equal(true, check_digit_valid_13("9783161484100"))
    end 
	
end
