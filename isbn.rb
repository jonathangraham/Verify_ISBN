def valid_isbn(n)
n = n.to_s

	if n.include? " "
	n.delete! ' '
	elsif n.include? "-"
	n.delete! '-'
	end

n.length == 10 || n.length == 13
end

def checksum_valid(n)	
array =[]
number = n.split ""
	number.each { |value|
	array << value.to_i }

sum = 0

	array.each.with_index { |index, value|
	sum += value * (index + 1) }
	
checksum = sum%11
checksum == n[9]	

end

#valid_isbn("123-456-7890")