def take_array(arr)
  yield(*arr)
end

birds = %w(raven finch hawk eagle)
raptors = []

take_array(birds) do |_, _, *elements|
  raptors = elements
end

p raptors