require 'pry-byebug'

def bubble_sort!(arr)
  loop do
    swap_flag = false
    (0..arr.size - 2).each do |index| 
      first = arr[index]
      second = arr[index + 1]
      # binding.pry
      if block_given?
        next if yield(first, second)
      else
        next if first <= second
      end
      
      arr[index], arr[index + 1] = arr[index + 1], arr[index]
      swap_flag = true
    end
    break unless swap_flag
  end
  arr
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)


# Further exploration:

def bubble_sort2!(arr)
  loop do
    swap_flag = false
    (0..arr.size - 2).each do |index| 
      first = arr[index]
      second = arr[index + 1]
      next if yield(first) <= yield(second)
      
      arr[index], arr[index + 1] = arr[index + 1], arr[index]
      swap_flag = true
    end
    break unless swap_flag
  end
  arr
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort2!(array) { |value| value.downcase }
array == %w(alice bonnie Kim Pete rachel sue Tyler)