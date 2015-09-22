def valid_isbn(n)
n = n.to_s

	if n.include? " "
	n.delete! ' '
	elsif n.include? "-"
	n.delete! '-'
	end

	if n.length == 10
	check_digit_contains_X(n)
	elsif n.length == 13
	check_digit_valid_13(n)
	else puts "that is not a valid ISBN number."
	end
	
n.length == 10 || n.length == 13
end

def check_digit_contains_X(n)
number = n.split ""

	if number[9] == "x" || number[9] == "X"
	number[9] = 10
	end
	
number[9] == 10
check_digit_valid_10(number)
end

def check_digit_valid_10(n)
array =[]

	n.each { |value|
	array << value.to_i }

sum = 0

	array.each.with_index { |value, index|
	break if index == 9
	sum += (value * (index + 1)) }

check_digit = sum%11

	if check_digit == array[9]
	puts "This is a valid ISBN number."
	else puts "This is not a valid ISBN number."
	end
	
check_digit == array[9]
end

def check_digit_valid_13(n)
number = n.split ""
array =[]

	number.each { |value|
	array << value.to_i }
	
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
	puts "This is a valid ISBN number."
	else puts "This is not a valid ISBN number."
	end

array[12] == check_digit
end

puts "Enter the ISBN number to be verified:"
n = gets.chomp
valid_isbn(n)