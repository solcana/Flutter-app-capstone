# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Seeding initial dummy data (users, travel logs and destinations)

PASSWORD = "password123"

usmanb = User.create!(username: "Usman Bashir", email: "usmanb@gmail.com", password: PASSWORD)
janetn = User.create!(username: "Nanet Nackson", email: "nanetn@gmail.com", password: PASSWORD)
dollyb = User.create!(username: "Tolly Barton", email: "tollyb@gmail.com", password: PASSWORD)
meltonj = User.create!(username: "Alton John", email: "altonj@gmail.com", password: PASSWORD)
asapm = User.create!(username: "Asap Mrocky", email: "asapm@gmail.com", password: PASSWORD)


beach = Destination.create!(category: "beach")
mountain = Destination.create!(category: "mountain")
lake = Destination.create!(category: "lake")
city = Destination.create!(category: "city")


travellog1 = TravelLog.create!(user: usmanb, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/London_Big_Ben_Phone_box.jpg/640px-London_Big_Ben_Phone_box.jpg", destination: city, title: "London is the capital of Great Britain 🇬🇧", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut blandit mauris. Vestibulum sagittis, mauris eu rhoncus posuere, tellus nisl feugiat dolor, in mollis libero arcu in felis. Suspendisse lacinia vulputate nunc ac faucibus.")
travellog2 = TravelLog.create!(user: usmanb, image: "https://a.cdn-hotels.com/gdcs/production162/d958/882ceff2-9352-468c-9254-11d60ffe3522.jpg?impolicy=fcrop&w=800&h=533&q=medium", destination: beach, title: "Spent the weekend with popcorn on the beach! 🍿🌊", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut blandit mauris. Vestibulum sagittis, mauris eu rhoncus posuere, tellus nisl feugiat dolor, in mollis libero arcu in felis. Suspendisse lacinia vulputate nunc ac faucibus.")
travellog3 =TravelLog.create!(user: dollyb, image: "https://www.snow-forecast.com/system/images/35278/medium/Silver-Mountain.jpg", destination: mountain, title: "Amazing skiing vacation ⛷", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut blandit mauris. Vestibulum sagittis, mauris eu rhoncus posuere, tellus nisl feugiat dolor, in mollis libero arcu in felis. Suspendisse lacinia vulputate nunc ac faucibus.")
travellog4 =TravelLog.create!(user: asapm, image: "https://www.usnews.com/object/image/0000017a-1223-da19-a37e-5b6361120000/lake-tahoe.jpg?update-time=1623801946397&size=responsive640",destination: lake, title: "Lake Tahoe is Bliss 🧖‍♂️", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut blandit mauris. Vestibulum sagittis, mauris eu rhoncus posuere, tellus nisl feugiat dolor, in mollis libero arcu in felis. Suspendisse lacinia vulputate nunc ac faucibus.")





