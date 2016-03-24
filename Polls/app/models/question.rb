class Question < ActiveRecord::Base
  validates :poll_id, :text, presence: true

  def results
    results = {}

    join_condition = <<-SQL
      LEFT OUTER JOIN responses
        ON responses.answer_choice_id = answer_choices.id
    SQL

    choices = answer_choices.joins(join_condition)
                            .group('answer_choices.id')
                            .select('text, COUNT(responses.id) AS votes')

    choices.each {|choice| results[choice.text] = choice.votes}

    results
  end

  belongs_to :poll,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: :Poll

  has_many :answer_choices,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: :AnswerChoice

  has_many :responses,
    through: :answer_choices,
    source: :responses
end
