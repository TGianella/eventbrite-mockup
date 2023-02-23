# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActionMailer::Base.perform_deliveries = false

User.destroy_all
Event.destroy_all
Attendance.destroy_all

5.times do |_|
  user = User.new(first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  password: 'foobar')
  user.email = (user.first_name + user.last_name + '@yopmail.com').downcase
  user.save
end

12.times do |_|
  event = Event.new(start_date: Faker::Date.forward(days: 30),
                    duration: Faker::Number.within(range: 2..6) * 5,
                    title: Faker::Lorem.sentence,
                    description: Faker::Lorem.paragraph,
                    price: Faker::Number.within(range: 2..900),
                    location: Faker::Address.street_address,
                    user: User.all.sample)
  event.image.attach(io: File.open("#{Rails.root}/app/assets/images/dog-placeholder.jpg"), filename: 'event_image')
  event.save!
end
