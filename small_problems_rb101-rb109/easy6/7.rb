def halvsies(arr)
  arr1 = arr.clone
  arr2 = arr1.pop(arr.size / 2)
  [arr1, arr2]
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]] # true
p halvsies([1, 2, 3, 4, 1]) #== [[1, 2, 3], [4, 1]] # true
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]] # true
p halvsies([5]) #== [[5], []] # true
p halvsies([]) #== [[], []] # true

# Further solution: the official sotluion uses 2.0 so as to round up the halfway point.