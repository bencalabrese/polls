class Question < ActiveRecord::Base
  validates :poll_id, :text, presence: true

  belongs_to :poll,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: :Poll

  has_many :answer_choices,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: :AnswerChoice
end
