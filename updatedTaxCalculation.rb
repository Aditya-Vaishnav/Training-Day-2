require 'csv'
load 'Tax.rb'
load 'IOclass.rb'
load 'Purchase.rb'

csv = IOclass.new("input.csv")		# it will load file
csv.to_purchase				# Converting to Array of Purchase object
Purchase.get_purchases.each do |i|	
i.write_to_csv				# Writting file to CSV
end

