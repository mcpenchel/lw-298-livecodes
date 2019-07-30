require 'date'

def until_christmas(year=Date.today.year)
  christmas_date = Date.new(year, 12, 25)

  if Date.today > christmas_date
    christmas_date = Date.new(year + 1, 12, 25)
  end

  (christmas_date - Date.today).to_i
end


puts until_christmas.class == Integer
puts until_christmas == 148
puts until_christmas
