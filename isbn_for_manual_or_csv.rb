def check_for_space_or_dash(n)
	n.delete! ' ' if n.include? " "
	n.delete! '-' if n.include? "-"
@number = n.split ""
n #for TDD
end

def remove_extra_characters(number)
	number.slice!(0)
	number.slice!(-1)
	number.slice!(-1)
@number2 = number
end

def check_number_length(number)
@number3 = number
length = @number3.count

case length
	
	when 10
	check_digit_contains_X(@number3)
		if only_numeric_characters(@new_number) == true
		@result = false
		else check_digit_valid_10(@new_number)
		end
	
	when 13
		if only_numeric_characters(@number3) == true
		@result = false
		else check_digit_valid_13(@number3)
		end
	
	else @result = false
	
end
length == 10 || length == 13 ? true : false #for TDD
end

def check_digit_contains_X(number)
	
	if number[9] == "x" || number[9] == "X"
	number[9] = "10"
	end

@new_number = number
end

def only_numeric_characters(n)
n = n.join("")

	true if n =~ /\D/ 

end

def check_digit_valid_10(number)
array = number.collect(&:to_i)

sum = 0

	array.each.with_index { |value, index|
	break if index == 9
	sum += (value * (index + 1)) }

check_digit = sum%11
	
	if check_digit == array[9]
	@result = true
	else @result = false
	end
check_digit == array[9] ? true : false #for TDD
end

def check_digit_valid_13(number)
array = number.collect(&:to_i)

sum = 0
check_digit = 0

        array.each_with_index { |value, index|
            break if index == 12
			if index % 2 == 0
            sum += value * 1
            else
            sum += value * 3
			end 
		}
		
	sum = sum % 10
    check_digit = (10 - sum)
	
		if check_digit == 10
		check_digit = 0
		end
		
	if array[12] == check_digit
	@result = true
	else @result = false
	end
array[12] == check_digit ? true : false #for TDD
end

def import_menu
puts """
Choose manual input or csv import:

1. Manual ISBN number input
2. Use input_isbn_file.csv

"""

choice = gets.chomp.to_i

	if choice == 1
		print "\nEnter ISBN Number:\n"
		n = gets.chomp
		check_for_space_or_dash(n)
		check_number_length(@number)
		print @result == true ? "\nThat is a valid ISBN number.\n\n" : "\nThat is not a valid ISBN number.\n\n"
	elsif choice == 2
		file = File.open('input_isbn_file.csv', "r")
		@new_file = File.open('output_isbn_file.csv', "w")

			file.each do |row| 
			check_for_space_or_dash(row)
			remove_extra_characters(@number)
			check_number_length(@number2)
			@row = row
			@new_file.puts @result == true ? @row.chomp + ", Valid" : @row.chomp + ", Invalid"
			end
		
		file.close
		@new_file.close
		print "\n\nProcessing Complete - output_isbn_file.rb is ready.\n\n"
	else 
		puts "Choose 1 or 2 please"
		import_menu
	end

end
import_menu