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
		if point2 < start || point2 > endd
			return nil
		end

		if point2.abs < accuracy
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
		return (start - endd).abs*self.value((start+endd)/2)
	end

	def gnuplot
		for i in (0..10000)
			puts "#{i}  #{self.value(i)}"
		end
	end

end



definition = Proc.new { |x|  x*x*Math.sin(x) }
F = Funkcja.new(definition)
puts F.value(25)
puts F.poch(50)

puts F.zerowe(-2, 2, 0.005)

puts F.pole(0,4)

F.gnuplot
