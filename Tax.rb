class Tax
   def Tax.calcTax(price,qty)
	price_rounded=(price.to_f*qty.to_i).round # Calculating Tax considering Quantity
	return (price_rounded/10.0).round(2)	  
   end
   def Tax.calcImportDuty(price,qty)
	price_rounded=(price.to_f*qty.to_i).round # Calculating Import Duty considering Quantity
	return (price_rounded/20.0).round(2)
   end
end
