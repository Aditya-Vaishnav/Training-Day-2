class Purchase
   @@purchases = Array.new
   @@grand_total =0
   @@tax_free = ["Book","Chocolate Box","Chocolate Bar","Headache Pills"]
   def initialize(name,price,qty,imported)
	@name = name
	@price = price
	@qty = qty
	@imported =imported
	if(!@@tax_free.include?(name))	
	@tax = Tax.calcTax(@price,@qty)		 		#Automated Calculation of Tax
	else
	@tax = 0.0
	end
	if(@imported.eql?("y"))
	@imp_duty = Tax.calcImportDuty(@price,@qty)		#Automated Calculation of import duty
	else
	@imp_duty = 0	
	end
	@total_price = ((@price*@qty)+@tax+@imp_duty).round(2)  #Total price with inclusive of all taxes
	@@purchases << self
   end
   def self.get_purchases   
	@@purchases
   end
   def  total_price
	@total_price.to_f
   end
   def setGrandTotal(total)					#Managing GrandTotal for the Bill
	@@grand_total =(@@grand_total+total).round(2)
   end
   def to_a
	return [@name.to_s,@price.to_s,@qty.to_s,@imported.to_s,@tax.to_s,@imp_duty.to_s,@total_price.to_s]
   end
   def get_total
	@@total
   end
   def write_to_csv						#output to CSV
	CSV.open("outputFile.csv","w") do |csv|
	csv << self.to_a
	self.setGrandTotal(self.total_price)
	end
   end
end
