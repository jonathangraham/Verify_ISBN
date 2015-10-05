def check_for_space(n)
	if n.include? " "
	n.delete! ' '
	end
end

def check_for_dash(n)
	if n.include? "-"
	n.delete! '-'
	end
end

def remove_extra_characters(n)
number = n.split ""
	number.slice!(0)
	number.slice!(-1)
	number.slice!(-1)
n = number.join("")
end

def check_number_length(n)
@n = n
length = @n.length

case length
	
	when 10
	check_digit_contains_X(@n)
		if only_numeric_characters(@new_number) == true
		@result = false
		else check_digit_valid_10(@new_number)
		end
	
	when 13
		if only_numeric_characters(@n) == true
		@output = false
		else check_digit_valid_13(@n)
		end
	
	else @result = false
	
end
length == 10 || length == 13 ? true : false
end

def check_digit_contains_X(number)
number = number.split ""
	
	if number[9] == "x" || number[9] == "X"
	number[9] = "10"
	end

@new_number = number.join("")
end

def only_numeric_characters(n)
	
	true if n =~ /\D/ 

end

def check_digit_valid_10(n)
number = n.split ""
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
check_digit == array[9] ? true : false
end

def check_digit_valid_13(n)
number = n.split ""
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

end

def output_manual(result)
	if result == true
	puts "That is a valid ISBN number."
	else puts "That is not a valid ISBN number."
	end
end

def output_csv(result)
	if result == true
	new_file.puts row.chomp + ", Valid"
	
	else new_file.puts row.chomp + ", Invalid"
	end

file.close
new_file.close
end

def import_menu
puts """
Choose manual input or csv import:

1. manual ISBN number input
2. Use input_isbn_file.csv

"""

choice = gets.chomp.to_i

	if choice == 1
		puts "Enter ISBN Number:"
		n = gets.chomp
		check_for_space(n)
		check_for_dash(n)
		check_number_length(n)
		output_manual(@result)
	elsif choice == 2
		file = File.open('input_isbn_file.csv', "r")
		new_file = File.open('output_isbn_file.csv', "w")

			file.each do |row| 
			check_for_space(row)
			check_for_dash(n)
			remove_extra_characters(n)
			check_number_length(n)
			output_csv(@result)
			end
	else 
		puts "Choose 1 or 2 please"
		import_menu
	end
end
#import_menu