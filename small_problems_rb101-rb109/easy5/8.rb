NUM_TO_WORDS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(arr)
  arr.sort_by { |num| NUM_TO_WORDS[num] }
end

p alphabetic_number_sort((0..19).to_a) == [
   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
   6, 16, 10, 13, 3, 12, 2, 0
 ]

# #sort_by! would mutate the object reference passed as an argument to our method, which would be more appropriate if our method was named #alphabetic_number_sort!, but since it is not named with the '!', making it a mutating method on the caller would be misleading.


# Further exploration using #sort

def alphabetic_number_sort_2(arr)
arr.sort { |a, b| NUM_TO_WORDS[a] <=> NUM_TO_WORDS[b] }
end

puts

p alphabetic_number_sort_2((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]