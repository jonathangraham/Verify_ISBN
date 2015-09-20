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
	
end