require 'rails_helper'
require 'minitest/autorun'

RSpec.describe Word, :type => :model do
  describe 'find_words' do
    it "finds the entry related to the single selected character" do
      word = '笨'
      word_index = 2
      text = "我是笨蛋"
      expect(Word.count).to eq 1
      expect(Word.find_words(word_index, text).count).to eq 1
    end
  end
end
