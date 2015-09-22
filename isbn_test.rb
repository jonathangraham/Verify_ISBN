require_relative "isbn.rb"
require "minitest/autorun"

class Isbn_test < Minitest::Test

	def test_for_correct_number_of_characters_10
	assert_equal(true, valid_isbn(1234567890))
	end
	
	def test_for_correct_number_of_characters_13
	assert_equal(true, valid_isbn(1234567890123))
	end
	
	def test_for_correct_number_of_characters_15
	assert_equal(false, valid_isbn(123456789012345))
	end
	
	def test_to_remove_dashes
	assert_equal(true, valid_isbn("123-4567-890"))
	end
	
	def test_to_remove_spaces
	assert_equal(true, valid_isbn("123 4567 890"))
	end
	
	def test_for_x
	assert_equal(true, check_digit_contains_X("080442957X"))
	end
	
	def test_for_10_digit_math
	assert_equal(true, check_digit_valid_10([0,3,0,6,4,0,6,1,5,2]))
	end
	
	def test_for_thirteen_character_math
    assert_equal(true, check_digit_valid_13("9780156027328"))
    assert_equal(false, check_digit_valid_13("780670020485"))
    assert_equal(false, check_digit_valid_13("134567891111"))
	assert_equal(true, check_digit_valid_13("9780306406157"))
    end 
	
end