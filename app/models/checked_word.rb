class CheckedWord < ActiveRecord::Base
  belongs_to :word
  belongs_to :user

  def pick_pronunciation_options
    word = self.word
    pronunciations = [word]
    similar_words = word.find_similar_words.sample(4)
    similar_words.each {|w| pronunciations << w unless w.pronunciation == word.pronunciation}
    return pronunciations[0..3].shuffle
  end


end
