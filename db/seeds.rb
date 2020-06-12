# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroy all tables and restart the id at 1

JoinUserInterest.destroy_all
User.destroy_all
Feedback.destroy_all
Flag.destroy_all
Interest.destroy_all
City.destroy_all
Job.destroy_all


#City
13.times do |index|
  u = City.new
  u.name = Faker::Address.city
  puts "City #{index} created" if u.save
end

#Job
6.times do |index|
  u = Job.new
  u.name = %w(Student Engineer Doctor Artist MoreJobsLater Unemployed)[index]
  puts "Job #{index} created" if u.save
end


#User
number_of_users = 30
number_of_users.times do |index|
  u = User.new
  u.email = "findnewfriends_#{index}@yopmail.com"
  u.email = "findnewfriends_admin@yopmail.com" if index == 0
  u.password = '123123' #Faker::Internet.password
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.birthdate = Faker::Time.between_dates(to: 18.year.from_now, from:  100.year.from_now, period: :day)
  u.gender = %w(M F).sample
  u.job = Job.all.sample
  u.city = City.all.sample
  u.role = "admin" if index == 0
  u.description = "Description #{index}"
  puts "User #{index} created" if u.save
end

#Feedback
(number_of_users*2).times do |index|
  u = Feedback.new
  u.author = User.all.sample
  u.recipient = User.all.sample
  u.content = "Content Feedback #{index}"
  u.recommended = true
  u.recommended = false if index % 15 == 0
  puts "Feedback #{index} created" if u.save
end

#Flag
(number_of_users/10).times do |index|
  u = Flag.new
  u.author = User.all.sample
  u.recipient = User.all.sample
  u.content = "Content Flag #{index}"
  puts "Flag #{index} created" if u.save
end

#Interest
interest=%w(Painting Sports Board\ games Video\ games Travelling Movies Music Photography Stand\ up Reading Meditation Hiking Cooking)
interest.length.times do |index|
  u = Interest.new
  u.name = interest[index]
  puts "Interest #{index} created" if u.save
end

#JoinUserInterest
User.all.each_with_index do |user,index|
  9.times do
    u = JoinUserInterest.new
    u.user = user
    u.interest = Interest.all.sample
    u.intensity = rand(1..5)
    puts "JoinUserInterest #{index} created" if u.save
  end
end

















#
