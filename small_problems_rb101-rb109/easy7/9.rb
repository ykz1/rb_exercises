def multiply_all_pairs(arr1, arr2)
  arr1.each_with_object([]) do |arr1_num, output| 
    arr2.each do |arr2_num|
      output << (arr1_num * arr2_num)
    end
  end.sort
end


p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

def multiply_all_pairs2(arr1, arr2)
  arr1.product(arr2).map { |pair| pair.inject(:*) }.sort
end

p multiply_all_pairs2([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
