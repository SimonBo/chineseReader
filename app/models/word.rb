class Word < ActiveRecord::Base
  def self.find_words(word_index, text)
    text = Text.find(text).content
    word_index = word_index.to_i
    char_index = word_index.to_i
    char = text[char_index]
    words_containing_char = Word.where('simplified_char like ?', "%#{char}%")
    simplified_chars = words_containing_char.map { |w| w.simplified_char }
    matches =[char]
    # puts "Matches array: #{matches}"

    check_from = 0
    check_from = word_index - 10 if word_index > 10 
    # puts "Gonna check text from index: #{check_from}"

    check_to = -1
    check_to = word_index +10 if text.length - word_index > 10
    # puts "Gonna check to index: #{check_to}"

    (check_from..char_index).each do |iteration|
      # puts "Iteration: #{iteration}"
      unless text[check_from+iteration].nil?
        text[check_from+iteration..check_to].each_char.with_index do |word, index|
            checked_word = text[check_from+iteration..check_from+iteration+index]
            # puts "Checking #{checked_word}"
            unless checked_word.nil? or checked_word.blank? or !checked_word.include? char
              matches << checked_word if simplified_chars.include? checked_word and !matches.include? checked_word
            end
        end
      end
    end

    final_match = matches.group_by(&:size).max.last
    Word.where('simplified_char = ?', final_match)
  end
end
