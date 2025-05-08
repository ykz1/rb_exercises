UNAME = "admin"
PASSWORD = "asdf"


loop do
  puts "Enter user name:"
  input_username = gets.chomp

  puts "Enter password:"
  input_password = gets.chomp
  
  if input_username == UNAME && input_password == PASSWORD
    puts "Welcome!"
    break
  else
    puts "Authorization failed."
  end
end
