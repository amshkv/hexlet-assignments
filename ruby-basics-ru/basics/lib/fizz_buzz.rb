# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return nil if start > stop

  result = ''
  while start <= stop
    current = get_fizz_buzz_text_by_number(start)
    result = "#{result} #{current}"
    start += 1
  end
  result.strip
end

def get_fizz_buzz_text_by_number(number)
  if (number % 15).zero?
    'FizzBuzz'
  elsif (number % 3).zero?
    'Fizz'
  elsif (number % 5).zero?
    'Buzz'
  else
    number
  end
end

# END
