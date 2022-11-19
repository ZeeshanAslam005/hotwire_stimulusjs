# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
Faker::Name.name
Faker::Internet.email

5.times do
    PersonalDatum.create(first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name,
                        nick_name: Faker::Name.name,
                        email: Faker::Internet.email,
                        phone: Faker::Base.numerify('###-###-####') )

    Employee.create
end

employee = Employee.all

5.times do 
    Employment.create(employeer: Faker::Name.unique.name,
                      date_started: Faker::Date.between_except(from: 10.year.ago, to: 1.year.from_now, excepted: Date.today),
                      date_employment_ended: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today),
                      employee: employee[rand(0..4)])
end