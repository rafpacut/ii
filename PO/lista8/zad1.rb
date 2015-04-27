class Fixnum
	def prime?
		for i in (2..self-1)
			if self % i == 0
				return false
			end
		end
		return true

	end

	def ack(x)
		if self == 0
			return x + 1
		end
		
	end

	def perfect
		sum = 0
		for i in 1..self-1
			if self % i == 0
				sum += i 
			end
		end
		if sum == self
			return true
		else
			return false
		end
	end


	def slownie
		number = self
		string = ""
		while number > 0
			digit = number % 10
			number = number / 10
			case digit
			when 0
				string = " zero "    + string 
			when 1                       
				string = " jeden "   + string 
			when 2                      
				string = " dwa "     + string 
			when 3                     
				string = " trzy "    + string 
			when 4                    
				string = " cztery "  + string 
			when 5                   
				string = " piec "    + string 
			when 6                  
				string = " szesc "   + string 
			when 7                 
				string = " siedem "  + string 
			when 8                
				string = " osiem "   + string 
			when 9               
				string = " dziewiec "+ string 
			end
		end
			puts string
	end

	def ackermann(n, m)
		if n == 0
			return m +1
		end
		if m == 0
			return ackermann
	end

	def ack(y)
		return ackermann(self, y)
	end
end

puts 6.prime?
puts 6.perfect
puts 5.perfect
123.slownie

2.ack(1)
