# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Genre.destroy_all

genre_list = [
  { name: "球類活動" },
  { name: "路上活動" },
  { name: "水上活動" },
  { name: "桌上活動" },
  { name: "踏青活動" },
]

genre_list.each do |genre|
  Genre.create( name: genre[:name] )
end
puts "建立#{Genre.count}個活動類型"

User.create(name: 'Duncan', role: 'admin', password: '111111', email: '123@123')