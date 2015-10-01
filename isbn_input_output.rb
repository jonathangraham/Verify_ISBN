require_relative "isbn_for_csv.rb"

file = File.open('input_isbn_file.csv', "r")
new_file = File.open('output_isbn_file.csv', "w")

file.each { |row| check_for_space_or_dash(row)
#	new_file.print @number
	if @output == true
	new_file.puts row.chomp + ", Valid"
	
	else new_file.puts row.chomp + ", Invalid"
	end
	}

file.close
new_file.close


#check_for_space_or_dash("877195869x")
#puts @output