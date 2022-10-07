# frozen_string_literal: true

# BEGIN
def reverse(str)
  result = ''
  i = 0
  while i < str.length
    result = "#{str[i]}#{result}"
    i += 1
  end
  result
end
# END
