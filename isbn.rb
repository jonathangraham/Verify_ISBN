def valid_isbn(n)
n = n.to_s

	if n.include? " "
	n.delete! ' '
	elsif n.include? "-"
	n.delete! '-'
	end

n.length == 10 || n.length == 13
end

#valid_isbn("123-456-7890")