require 'date'

def friday_13th(year)
  (1..12).to_a.count do |month|
    Date.new(year, month, 13).friday?
  end
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2