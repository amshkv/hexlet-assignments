# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def build_query_string(options)
  sorted_keys = options.keys.sort
  result = []
  for key in sorted_keys do
    result << "#{key}=#{options[key]}"
  end
  result.join('&')
end
# END
# rubocop:enable Style/For
