# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
   #City.create!([{name: Faker::Address.city}])
   Employee.create!([{name:Faker::Name.name,
   	city_id:Faker::Number.between(38, 57),
   	manager_id: Faker::Number.between(33, 42)}])
end