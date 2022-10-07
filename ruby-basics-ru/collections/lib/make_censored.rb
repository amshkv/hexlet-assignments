# frozen_string_literal: true

# rubocop:disable Style/For

def make_censored(text, stop_words)
  # BEGIN
  result = []
  words = text.split

  for word in words do
    current_word = stop_words.include?(word) ? '$#%!' : word
    result << current_word
  end

  result.join(' ')
  # END
end

# rubocop:enable Style/For
