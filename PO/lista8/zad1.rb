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

	def doskonala?
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
		slowa = [" zero ", " jeden ", " dwa ", " trzy ", " cztery ", 
	   			" piec ", " szesc ", " siedem ", " osiem ", " dziewiec "]
		while number > 0
			digit = number % 10
			number = number / 10
			string = slowa[digit] + string
		end
			puts string
	end


	def ack(y)
		if self == 0
			return y+1
		end
		if y == 0
			return (self-1).ack(1)
		end
		return (self-1).ack(self.ack(y-1))
	end
end

puts 6.prime?
puts 5.prime?
puts 6.doskonala?
puts 5.doskonala?
123.slownie

puts 2.ack(1)
