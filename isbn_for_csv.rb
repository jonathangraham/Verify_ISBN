def check_for_space_or_dash(n)

	if n.include? " "
	n.delete! ' '
	else n.include? "-"
	n.delete! '-'
	end
remove_extra_characters(n)

end

def remove_extra_characters(n)

number = n.split ""
number.slice!(0)
number.slice!(-1)
number.slice!(-1)
check_number_length(number)

end

def check_number_length(number)
@number = number
length = number.count

case length
	
	when 10
	check_digit_contains_X(@number)
		if only_numeric_characters(@new_number) == true
		@output = false
		else check_digit_valid_10(@new_number)
		end
	
	when 13
		if only_numeric_characters(@number) == true
		@output = false
		else check_digit_valid_13(@number)
		end
	
	else @output = false
	
end

end

def check_digit_contains_X(number)

	if number[9] == "x" || number[9] == "X"
	number[9] = "10"
	end

@new_number = number
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
	@output = true
	else @output = false
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
	@output = true
	else @output = false
	end

end