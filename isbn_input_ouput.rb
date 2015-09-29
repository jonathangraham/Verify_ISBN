require_relative "isbn_for_csv.rb"
require 'csv'

CSV.open('output_isbn_file.csv', 'w') { |object|

CSV.foreach('input_isbn_file.csv') { |row| 
	number = row.join("")
	check_for_space_or_dash(number)

	if @output == true
	object << "#{row}, Valid" 
	else object << "#{row}, Invalid"
	end
	}

}