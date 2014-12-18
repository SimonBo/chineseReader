json.array!(@words) do |word|
  json.extract! word, :id, :traditional_char, :simplified_char, :pronunciation, :meaning
  json.url word_url(word, format: :json)
end
