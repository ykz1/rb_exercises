def max_by(collection)
  return nil if collection.empty?

  value_max = yield(collection[0])
  max = collection[0]
  index = 1

  until index == collection.size
    element = collection[index]
    value = yield(element)
    if value > value_max
      value_max = value
      max = element
    end
    index += 1
  end

  max

end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil