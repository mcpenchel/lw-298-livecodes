require 'date'

def days_until_christmas(year=Date.today.year)
  christmas_date = Date.new(year, 12, 25)

  if Date.today > christmas_date
    christmas_date = Date.new(year + 1, 12, 25)
  end

  (christmas_date - Date.today).to_i
end


puts days_until_christmas.class == Integer

# For this to keep working in the future
time_diff = (Date.today - Date.new(2019, 7, 30)).to_i

# Considering when this was done, on July 30, 2019
puts days_until_christmas == 148 + time_diff
puts days_until_christmas(2020) == 514 + time_diff

# We're traveling to the future, folks!
# To test the post-xmas condition.
class Date
  def Date.today
    return Date.new(2019,12,27)
  end
end

# 27 December 2019 -> xmas 2020
puts days_until_christmas == 364
