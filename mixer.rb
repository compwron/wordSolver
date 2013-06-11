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


	#  if word has more instances of a letter than the available letters has, remove it
	# for every letter in the alphabet as a key, assign, in an array, the first item as number of instances that 
	# the possible has. the second item, the number of instances that the letters[] have. if the first is larger than the second, 
	# delete the word

alphabet = ('A'..'Z').to_a

letter_count_of_available_letters = {}
alphabet.each{|letter|
	new_letter = {letter => 0}
	letter_count_of_available_letters.merge!(new_letter)
}.flatten

letters.each {|letter|
	letter_count_of_available_letters[letter] += 1
}

puts letter_count_of_available_letters