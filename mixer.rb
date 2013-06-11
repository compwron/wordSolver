letters = ["T", "A", "I", "A", "I", "I", "C", "N", "E", "M", "D", "T"]
letters_in_word = 9


letters_not_accepted = ('A'..'Z').to_a
letters.each {|letter|
	letters_not_accepted.delete(letter)
}

# puts letters_not_accepted

possibles = []

File.open("words.txt") do |file|
      file.each_line{ |word| 
      	if(word.size == letters_in_word) then
      		keep_word = true
      		letters_not_accepted.each { |letter|
      			if (word.include?(letter) || word.include?(letter.downcase)) then
      				keep_word = false
      				# puts "getting rid of: #{word}"
      			end
      		}
      		if keep_word then possibles += [word] end
      	end
      }
    end


puts possibles