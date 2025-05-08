PASSWORD = "asdf"

loop do
  puts "Enter password:"
  input = gets.chomp
  if input == PASSWORD
    puts "Welcome!"
    break
  else
    puts "Invalid password."
  end
end
