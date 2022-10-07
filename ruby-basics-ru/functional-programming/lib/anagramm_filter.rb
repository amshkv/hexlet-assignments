# frozen_string_literal: true

# BEGIN
def anagramm_filter(word, words)
  sorted_chars_word = sorted_chars(word)
  words.select { |w| sorted_chars(w) == sorted_chars_word }
end

def sorted_chars(word)
  word.chars.sort
end
# END
