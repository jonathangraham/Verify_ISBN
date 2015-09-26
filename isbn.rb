def check_for_space_or_dash(n)

	if n.include? " "
	n.delete! ' '
	elsif n.include? "-"
	n.delete! '-'
	end
check_number_length(n)
n
end

def check_number_length(n)

number = n.split ""

case number
	when number.length == 10
	check_digit_contains_X(number)
		if only_numeric_characters(check_digit_contains_X) == true
		output(false)
		else check_digit_valid_10(check_digit_contains_X)
		end
		
	when number.length == 13
		if only_numeric_characters(check_digit_contains_X) == true
		output(false)
		else check_digit_valid_13(number)
		end
		
	else output(false)
	
number.length == 10 || number.length == 13 ? true : false
end

end

def check_digit_contains_X(number)

	if number[9] == "x" || number[9] == "X"
	number[9] = "10"
	end

number
end

def only_numeric_characters(number)

n = number.join("")
	
	true if n =~ /\D/ 

end

def check_digit_valid_10(number)
array =[]

	number.each { |value|
	array << value.to_i }

sum = 0

	array.each.with_index { |value, index|
	break if index == 9
	sum += (value * (index + 1)) }

check_digit = sum%11
	
	if check_digit == array[9]
	output(true)
	return true
	else output(false)
	end
end

def check_digit_valid_13(number)
	
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
	output(true)
	return true
	else output(false)
	end

end

def output(result)
	if result == true
	puts "That is a valid ISBN number."
	else puts "That is not a valid ISBN number."
	end
end

#puts "Enter the ISBN number to be verified:"
#n = gets.chomp
#check_for_space_or_dash(n)