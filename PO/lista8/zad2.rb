
class Jawna
	Alphabet = "abcdefghijklmnouprstuwxyzABCDEFGHIJKLMNOUPRSTUWXYZ "
	@string = ""
	def initialize(string)
		@string = string
	end

	def zaszyfruj(shift)
		shift = shift % Alphabet.length
		encrypted = ""
		for i in 0..(@string.length)-1
			index = Alphabet.index(@string[i])
			index2 = (index + shift) 
			index2 %= Alphabet.length
			encrypted += Alphabet[index2]
		end
		return Zaszyfrowane.new(encrypted)

	end

	def to_s
		return @string
	end
end



class Zaszyfrowane
	Alphabet = "abcdefghijklmnouprstuwxyzABCDEFGHIJKLMNOUPRSTUWXYZ "
	@string = ""

	def initialize(string)
		@string = string
	end

	def odszyfruj(shift)
		shift = shift % Alphabet.length
		decrypted = ""
		for i in 0..@string.length-1
			index = Alphabet.index(@string[i])

			if index - shift < 0
				index2 = Alphabet.length - ( shift - index )
			else
				index2 = index - shift
			end

			decrypted += Alphabet[index2]
		end
		return Jawna.new(decrypted)
	end

	def to_s
		return @string
	end

end


sentence = Jawna.new("Biale mleko")
encrypted = sentence.zaszyfruj(5)
sentence2 = encrypted.odszyfruj(5)
puts sentence2.to_s




