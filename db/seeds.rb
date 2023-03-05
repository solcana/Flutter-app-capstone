# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Seeding initial dummy data (users, travel logs and destinations)

PASSWORD = "password123"

usmanb = User.create!(name: "Usman Bashir", email: "usmanb@gmail.com", password: PASSWORD)
janetn = User.create!(name: "Janet Nackson", email: "janetn@gmail.com", password: PASSWORD)
dollyb = User.create!(name: "Dolly Barton", email: "dollyb@gmail.com", password: PASSWORD)
meltonj = User.create!(name: "Melton John", email: "meltonj@gmail.com", password: PASSWORD)
asapm = User.create!(name: "Asap Mocky", email: "asapm@gmail.com", password: PASSWORD)



beach = Destination.create!(category: "beach")
mountain = Destination.create!(category: "mountain")
lake = Destination.create!(category: "lake")
city = Destination.create!(category: "city")


travellog1 = TravelLog.create!(user: usmanb, destination: city, title: "London is the capital of Great Britain 🇬🇧", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut blandit mauris. Vestibulum sagittis, mauris eu rhoncus posuere, tellus nisl feugiat dolor, in mollis libero arcu in felis. Suspendisse lacinia vulputate nunc ac faucibus.")
travellog2 = TravelLog.create!(user: usmanb, destination: beach, title: "Spent the weekend with popcorn on the beach! 🍿🌊", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut blandit mauris. Vestibulum sagittis, mauris eu rhoncus posuere, tellus nisl feugiat dolor, in mollis libero arcu in felis. Suspendisse lacinia vulputate nunc ac faucibus.")
travellog3 =TravelLog.create!(user: dollyb, destination: mountain, title: "Amazing skiing vacation ⛷", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut blandit mauris. Vestibulum sagittis, mauris eu rhoncus posuere, tellus nisl feugiat dolor, in mollis libero arcu in felis. Suspendisse lacinia vulputate nunc ac faucibus.")
travellog4 =TravelLog.create!(user: asapm, destination: lake, title: "Lake Tahoe is Bliss 🧖‍♂️", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut blandit mauris. Vestibulum sagittis, mauris eu rhoncus posuere, tellus nisl feugiat dolor, in mollis libero arcu in felis. Suspendisse lacinia vulputate nunc ac faucibus.")





