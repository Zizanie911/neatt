# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating 1 user and 3 tasks..."

user = User.new(
  email: "beatrice.troadec@gmail.com",
  password: "secret",
  username: "Bea",
  first_name: "Béatrice",
  last_name: "Troadec",
  date_of_birth: "17/03/1993"
)
user.save!

task = Task.new(
  name: "Yoga",
  details: "don't forget your mat!",
  priority: 2,
  start_at: Time.parse("#{Date.today} 16:00"),
  duration: 45,
  days: [2, 4]
)
task.user = user
task.save!

task = Task.new(
  name: "Send email to Matthieu",
  details: "matthieu@gmail.com",
  priority: 1
)
task.user = user
task.save!

task = Task.new(
  name: "Buy beers",
  details: "",
  priority: 3
)
task.user = user
task.save!
