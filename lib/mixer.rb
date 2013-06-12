class Mixer
  attr_reader :possibles

  def initialize(letters_in_word, letters)
    puts "going to make a word with #{letters_in_word} letters made from letters: #{letters}"

    possible_letters_map = alphabet_map_for_letters(letters)
    real_possibles = []
    find_words_with_X_characters(letters, letters_in_word).each { |word|
      letters = word.strip.split("")
      potential_alphabet_map = alphabet_map_for_letters(letters)
      potential_alphabet_map.each { |alphabet_character|
        if (potential_alphabet_map[alphabet_character] == possible_letters_map[alphabet_character]) || (potential_alphabet_map[alphabet_character] < possible_letters_map[alphabet_character]) then
          real_possibles += [word]
        end
      }
    }

    @possibles = real_possibles & real_possibles # removing duplicates
  end

  def find_words_with_X_characters(letters_in_word, number_of_letters_in_word)
    letters_not_accepted = ('A'..'Z').to_a
    letters_in_word.each { |letter|
      letters_not_accepted.delete(letter)
    }

    possibles = []

    File.open("config/words.txt") do |file|
      file.each_line { |word|
        if (word.strip.size == number_of_letters_in_word) then
          keep_word = true
          letters_not_accepted.each { |letter|
            if (word.include?(letter) || word.include?(letter.downcase)) then
              keep_word = false
              # puts "getting rid of: #{word}"
            end
          }
          if keep_word then
            possibles += [word]
          end
        end
      }
    end
    possibles
  end


  #  if word has more instances of a letter than the available letters has, remove it
  # for every letter in the alphabet as a key, assign, in an array, the first item as number of instances that
  # the possible has. the second item, the number of instances that the letters[] have. if the first is larger than the second,
  # delete the word

  def alphabet_map_for_letters(letters)
    alphabet = ('A'..'Z').to_a

    letter_count_of_available_letters = {}
    alphabet.each { |letter|
      new_letter = {letter => 0}
      letter_count_of_available_letters.merge!(new_letter)
    }.flatten

    letters.each { |letter|
      letter_count_of_available_letters[letter.upcase] += 1
    }

    letter_count_of_available_letters
  end
end