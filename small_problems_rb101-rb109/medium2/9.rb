def bubble_sort!(arr)
  last_index = arr.size - 2
  loop do
    swap_flag = false
    (0..last_index).each do |idx1|
      idx2 = idx1 + 1
      if arr[idx2] < arr[idx1]
        arr[idx1], arr[idx2] = arr[idx2], arr[idx1]
        swap_flag = true
      end
    end
    break if swap_flag == false
  end
  arr
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)