require_relative "isbn_for_csv.rb"

file = File.open('input_isbn_file.csv', "r")
new_file = File.open('output_isbn_file.csv', "w")

file.each do |row| 
check_for_space_or_dash(row)

print row
	if @output == true
	new_file.puts row.chomp + ", Valid"
	
	else new_file.puts row.chomp + ", Invalid"
	end
end

file.close
new_file.close