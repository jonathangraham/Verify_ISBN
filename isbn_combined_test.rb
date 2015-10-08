require_relative "isbn_for_manual_or_csv.rb"
require "minitest/autorun"

class Isbn_test < Minitest::Test

	def test_to_remove_dashes_and_spaces
	assert_equal("1234567890", check_for_space_or_dash("123-4567-890"))
	assert_equal("1234567890", check_for_space_or_dash("123 4567 890"))
	assert_equal("123456789", check_for_space_or_dash("123 456-789"))
	end
	
	def remove_characters_added_by_csv
	assert_equal(["L","O","L"], remove_extra_characters(["\"","L","O","L","\"","\n"]))
	end
	
	def test_for_correct_number_of_characters_10
	assert_equal(true, check_number_length(["1","2","3","4","5","6","7","8","9","0"]))
	assert_equal(false, check_number_length(["1","2","3","4","5","6","7","8","9","0","1"]))
	end
	
	def test_for_correct_number_of_characters_13
	assert_equal(true, check_number_length(["1","2","3","4","5","6","7","8","9","0","1","2","3"]))
	assert_equal(false, check_number_length(["1","2","3","4","5","6","7","8","9","0","1"]))
	end
	
	def test_for_replacement_of_x
	assert_equal("08044295710", check_digit_contains_X("080442957x"))
	assert_equal("0804429578", check_digit_contains_X("0804429578"))
	end
	
	def test_for_only_numeric_characters
	assert_equal(nil, only_numeric_characters(["1","2","3","4","5","6","7","8","9","0"]))
	assert_equal(true, only_numeric_characters(["1","2","3","x","5","6","7","8","9","0"]))
	end
	
	def test_for_10_character_math
	assert_equal(true, check_digit_valid_10(["0","4","7","1","9","5","8","6","9","7"]))
	assert_equal(false, check_digit_valid_10(["1","4","7","1","9","5","8","6","9","7"]))
	end
	
	def test_for_13_character_math
    assert_equal(true, check_digit_valid_13(["9","7","8","0","1","5","6","0","2","7","3","2","8"]))
    assert_equal(false, check_digit_valid_13(["7","8","0","6","7","0","0","2","0","4","8","5"]))
    assert_equal(false, check_digit_valid_13(["1","3","4","5","6","7","8","9","1","1","1","1"]))
	assert_equal(true, check_digit_valid_13(["9","7","8","0","3","0","6","4","0","6","1","5","7"]))
	assert_equal(true, check_digit_valid_13(["9","7","8","3","1","6","1","4","8","4","1","0","0"]))
    end

	def is_it_valid
	assert_equal(true, import_menu("877195869x"))
	assert_equal(true, import_menu("0471958697"))
	assert_equal(false, import_menu("isbn"))
	assert_equal(true, import_menu("9780470059029"))
	assert_equal(true, import_menu("9780131495050"))
	assert_equal(false, import_menu("0000000000000"))
	end
	
end
