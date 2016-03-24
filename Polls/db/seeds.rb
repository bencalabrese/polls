# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



200.times do
  # byebug
  u = User.create!(user_name: Faker::Internet.user_name)

  poll = Poll.create!(author: u.id, title: Faker::Hipster.words(3))

  5.times do
    Question.create!(text: Faker::Lorem.sentence, poll_id: poll.id)
  end
end
