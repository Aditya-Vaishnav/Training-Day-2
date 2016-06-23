class Purchase
   @@purchases = Array.new
   @@grand_total = 0
   @@no_of_writes = 0
   @@tax_free = ["Book","Chocolate Box","Chocolate Bar","Headache Pills"]
   def initialize(name,price,qty,imported)
	@name = name
	@price = price
	@qty = qty
	@imported =imported
	if(!@@tax_free.include?(name))
	puts "calculating tax"
	sleep 1	
	@tax = Tax.calcTax(@price,@qty)		 		#Automated Calculation of Tax
	else
	@tax = 0.0
	end
	if(@imported.eql?("y"))
	@imp_duty = Tax.calcImportDuty(@price,@qty)		#Automated Calculation of import duty
	else
	@imp_duty = 0.0	
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
   def get_initial_formatting
	CSV.open("outputFile.csv","w+") do |csv|
	csv << ["Product Name","Price","Quantity","Import Status","Tax","Import Duty","Total Cost"]	
	csv << []
    	end
   end
   def write_to_csv						#output to CSV
	if(@@no_of_writes==0)					#prepare file for first use
	   get_initial_formatting
	end		
	@@no_of_writes+=1
	CSV.open("outputFile.csv","a+") do |csv|
	csv << self.to_a
	self.setGrandTotal(self.total_price)
	if(@@no_of_writes == @@purchases.size)
	   puts "done"
	   csv << []
	   csv<< ["","","","","","Grand Total",@@grand_total]
	end
	end
   end
end
