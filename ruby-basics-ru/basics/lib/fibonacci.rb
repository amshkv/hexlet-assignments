# frozen_string_literal: true

# BEGIN
def fibonacci(num)
  return nil if num.negative?
  return 0 if num.zero?
  return 1 if [1, 2].include? num

  fibonacci(num - 1) + fibonacci(num - 2)
end
# END
