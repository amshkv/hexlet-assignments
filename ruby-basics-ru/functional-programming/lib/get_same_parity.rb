# frozen_string_literal: true

# BEGIN
def get_same_parity(numbers)
  return numbers if numbers.size <= 1

  condition = numbers.first.even?
  numbers.select { |number| number.even? == condition }
end
# END
