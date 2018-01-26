# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Hoa",
             email: "hoabuisla123@gmail.com",
             address:"Son la",
             phone:"0163688099",
             birthday: "3/27/1996",
             password:              "daigaoi1",
             password_confirmation: "daigaoi1",
             admin: true)
