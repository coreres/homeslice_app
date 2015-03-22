# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
# u = User.new(
#     email: "admin@example.com",
#     password: "1234",
#     password_confirmation: "1234",
#     admin: true
# )
# u.skip_confirmation!
# u.save!

# Test user accounts
# (1..50).each do |i|
#   u = User.new(
#       email: "user#{i}@example.com",
#       password: "1234",
#       password_confirmation: "1234"
#   )
#
#   u.skip_confirmation!
#   u.save!
#
#   puts "#{i} test users created..." if (i % 5 == 0)


  puts 'ROLES'
  YAML.load(ENV['ROLES']).each do |role|
    Role.find_or_create_by_name({ :name => role }, :without_protection => true)
    puts 'role: ' << role
  end
  puts 'DEFAULT USERS'
  user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
  puts 'user: ' << user.name
  user.add_role :admin
  user2 = User.find_or_create_by_email :name => 'Client User', :email => 'user2@example.com', :password => 'changeme', :password_confirmation => 'changeme'
  user2.add_role :client
  user3 = User.find_or_create_by_email :name => 'Agent User', :email => 'user3@example.com', :password => 'changeme', :password_confirmation => 'changeme'
  user3.add_role :agent
  user4 = User.find_or_create_by_email :name => 'Broker User', :email => 'user4@example.com', :password => 'changeme', :password_confirmation => 'changeme'
  user4.add_role :broker
  puts "users: #{user2.name}, #{user3.name}, #{user4.name}"


