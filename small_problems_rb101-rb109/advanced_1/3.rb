def transpose(arr)

  output = Array.new(arr.size) { Array.new(arr.size) }

  0.upto(arr.size - 1) do |row|
    0.upto(arr.size - 1) do |col|
      output[col][row] = arr[row][col]
    end
  end
  output
end
      

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]