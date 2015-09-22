def valid_isbn(n)
n = n.to_s

	if n.include? " "
	n.delete! ' '
	elsif n.include? "-"
	n.delete! '-'
	end

n.length == 10 || n.length == 13
end

def check_digit_valid_10(n)
array =[]
number = n.split ""
	
	if number[9] == "x" || number[9] == "X"
	number[9] = 10
	end

	number.each { |value|
	array << value.to_i }

sum = 0
print array
puts "\n"
	array.each.with_index { |value, index|
	break if index == 9
	sum += (value * (index + 1)) }

check_digit = sum%11
check_digit == array[9]	

end

#puts check_digit_valid_10("0306406152")
puts check_digit_valid_10("!@#$%^&*12")