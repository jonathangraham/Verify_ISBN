require_relative "isbn_for_manual_or_csv.rb"
require "minitest/autorun"

class Isbn_test < Minitest::Test

	def test_to_remove_dashes_and_spaces
	assert_equal("1234567890", check_for_dash("123-4567-890"))
	assert_equal("1234567890", check_for_space("123 4567 890"))
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
	assert_equal("08044295710", check_digit_contains_X("080442957x"))
	assert_equal("0804429578", check_digit_contains_X("0804429578"))
	end
	
	def test_for_only_numeric_characters
	assert_equal(nil, only_numeric_characters("1234567890"))
	assert_equal(true, only_numeric_characters("123x567890"))
	end
	
	def test_for_10_character_math
	assert_equal(true, check_digit_valid_10("0471958697"))
	assert_equal(false, check_digit_valid_10("1471958697"))
	end
	
	def test_for_13_character_math
    assert_equal(true, check_digit_valid_13("9780156027328"))
    assert_equal(false, check_digit_valid_13("780670020485"))
    assert_equal(false, check_digit_valid_13("134567891111"))
	assert_equal(true, check_digit_valid_13("9780306406157"))
	assert_equal(true, check_digit_valid_13("9783161484100"))
    end 
	
end
