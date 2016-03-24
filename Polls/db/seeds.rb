# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


100.times do
  u = User.create!(user_name: Faker::Internet.user_name)

  poll = Poll.create!(author_id: u.id, title: Faker::Hipster.sentence)

  5.times do
    q = Question.create!(text: Faker::Lorem.sentence, poll_id: poll.id)

    3.times do
      a = AnswerChoice.create!(question_id: q.id, text: Faker::Lorem.characters(1))

      Response.create!(answer_choice_id: a.id, user_id: User.all.sample.id)
    end
  end
end
