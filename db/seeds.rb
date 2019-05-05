# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email: "craigdavideastwood@gmail.com", username: "Craig Eastwood", password: "password")
user2 = User.create(email: "mashrur.hossain@gmail.com", username: "Mashrur Hossain", password: "password")
Message.create(content: "Hey there, is anyone online?", user: user)
Message.create(content: "Hey Craig, what's up?", user: user2)