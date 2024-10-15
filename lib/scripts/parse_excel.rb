require 'roo'
require 'json'

# Path to your Excel file
file_path = File.join(__dir__, '../data/data.xlsx') # UPDATE FILE NAME HERE

# Open the Excel file
xlsx = Roo::Spreadsheet.open(file_path)

# Get the first sheet
sheet = xlsx.sheet(0) 

# Initialize an array to store the parsed data
parsed_data = []

# Iterate over each row in the sheet (assuming no header, change offset to 1 if header exists. The logic is that the # refers to the total number of cells 'tall' the header is.)
sheet.each_row_streaming(offset: 0) do |row|
  # Assuming your data is in the first column
  full_path = row[0].value

  # Split the path by '::' and structure it
  parts = full_path.split('::') # The :: can be modified depending how the documents are structured.

  # Build a nested hash structure
  current_level = parsed_data
  parts.each do |part|
    existing_entry = current_level.find { |entry| entry[:name] == part }
    if existing_entry
      current_level = existing_entry[:children]
    else
      new_entry = { name: part, children: [] }
      current_level << new_entry
      current_level = new_entry[:children]
    end
  end
end

# Convert the parsed data to JSON
json_data = parsed_data.to_json

# Write the JSON data to a file
output_file_path = File.join(__dir__, '../data/data.json')
File.write(output_file_path, json_data)

puts "Data has been successfully parsed and written to #{output_file_path}"