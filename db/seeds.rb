# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
             name: 'test1',
             email: 'test1@test.com',
             password: 'aaaaaa',
             password_confirmation: 'aaaaaa',
             admin: true
             )

10.times do |index|
 Label.create(name: "ラベル#{index}")
end
