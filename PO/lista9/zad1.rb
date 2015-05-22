class Funkcja

	@definition

	def initialize(block_definition)
		@definition = block_definition
	end
	
	def value(point)
		return @definition.call(point)
	end

	def poch(point)
		return (@definition.call(point + 0.0005) - @definition.call(point))/0.0005
	end

	def zerowe_iterations(start, endd, accuracy, point)
		point2 = point - self.value(point) / self.poch(point)
		if point2 <= start || point2 >= endd
			return nil
		end

		if (self.value(point2)).abs < accuracy
			return point2
		else
			zerowe_iterations(start, endd, accuracy, point2)
		end


	end

	def zerowe(start, endd, accuracy)
		c = (start+endd)/2
		return zerowe_iterations(start, endd, accuracy, c)
	end


	def pole(start, endd)
	#	return (start - endd).abs*self.value((start+endd)/2)
		if (start-endd).abs <= 1
			if start < endd
				return 1*self.value(start)
			else
				return 1*self.value(endd)
			end
		end
		half1 = pole(start, (start+endd)/2)
		half2 = pole((start+endd)/2, endd)

		return half1 + half2
	end

	def gnuplot
		for i in (0..10000)
			puts "#{i}  #{self.value(i)}"
		end
	end

end



#definition = Proc.new { |x| x*x*x-2*x+1  }
#definition = Proc.new { |x| Math.sin(x) + x*x*x - 2*x - 2}
definition = Proc.new { |x| Math.sin(x) *  0.5*x*x*x - 2*x  +10}
#definition = Proc.new { |x| Math.sin(x) - 2}

F = Funkcja.new(definition)
#puts F.value(25)
#puts F.poch(50)
#
#puts F.zerowe(-10, 10, 0.005)
#
#puts F.pole(0,4)

F.gnuplot
