# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts
puts 'Creating Admin User...'
user = User.find_by email: ENV['ADMIN_USER_EMAIL']
if user.nil? then user = User.create email: ENV['ADMIN_USER_EMAIL'],
                                  password: ENV['ADMIN_USER_PASSWORD'],
                     password_confirmation: ENV['ADMIN_USER_PASSWORD'],
                                      role: ENV['ADMIN_ROLE']
else puts 'Admin user already exists!' end
puts 'User email: ' << user.email
