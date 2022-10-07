# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  men = users.select { |user| user[:gender] == 'male' }
  men.map { |man| man[:birthday].split('-').first }.tally
end
# END
