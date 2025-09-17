require 'roo'
require 'json'
require 'date'

file_path = File.join(__dir__, '../data/data.xlsx') # <- update path if needed
xlsx = Roo::Spreadsheet.open(file_path)
sheet = xlsx.sheet(0)

# Config
has_header = true   # set to false if your sheet DOES NOT have a header row
cols = (0...(sheet.last_column || 0)) # Covers all the columns that contain data, no matter if it’s A–G today or A–Z tomorrow.

# Helper to normalize cell values to JSON-friendly primitives
def normalize_value(v)
  return nil if v.nil?
  if v.is_a?(Date) || v.is_a?(DateTime) || v.is_a?(Time)
    v.respond_to?(:iso8601) ? v.iso8601 : v.to_s
  elsif v.is_a?(Numeric) || v.is_a?(TrueClass) || v.is_a?(FalseClass)
    v
  else
    v.to_s.strip
  end
end

# Build headers (either from first row or column letters)
seen = Hash.new(0)
headers = if has_header
  raw = sheet.row(sheet.first_row) # array of values for the header row
  cols.map.with_index do |ci, i|
    base = (raw[ci] || "column_#{i+1}").to_s.strip
    key = base.downcase.gsub(/\s+/, '_').gsub(/[^\w_]/, '')
    # ensure uniqueness
    seen[key] += 1
    seen[key] > 1 ? "#{key}_#{seen[key]}" : key
  end
else
  cols.map.with_index { |ci, i| (('A'.ord + i).chr).downcase } # ["a","b","c",...]
end

records = []
start_row = sheet.first_row + (has_header ? 1 : 0)
if start_row && sheet.last_row && start_row <= sheet.last_row
  start_row.upto(sheet.last_row) do |rnum|
    row_vals = sheet.row(rnum) # array of values (0-based indexes)
    values = cols.map { |ci| normalize_value(row_vals[ci]) }
    next if values.all? { |v| v.nil? || v == '' } # skip blank rows

    obj = {}
    headers.each_with_index do |h, idx|
      obj[h] = values[idx]
    end
    records << obj
  end
end

output = File.join(__dir__, '../data/data_rows.json')
File.write(output, JSON.pretty_generate(records))
puts "Wrote #{records.size} records -> #{output}"