json.array!(@checked_words) do |checked_word|
  json.extract! checked_word, :id, :word_id, :user_id, :counter
  json.url checked_word_url(checked_word, format: :json)
end
