# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create({firstname: "Sagar", lastname: "Bhosale", email: "sagarbhosale019@gmail.com", password_hash: "86f7e437faa5a7fce15d1ddcb9eaeaea377667b8", views: 0})