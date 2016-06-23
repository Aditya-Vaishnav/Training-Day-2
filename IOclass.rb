class IOclass
   def initialize (filename)
	@csv = CSV.read(filename.to_s)
   end
   def to_purchase
	count=0			#to skip the first line of input file
	@csv.each do |i|
	if(count==0)
	   count=1
	   else
	   p = Purchase.new(i[0],i[1].to_f,i[2].to_i,i[3].to_s)
	   end	
	end
   end
end
