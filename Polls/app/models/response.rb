class Response < ActiveRecord::Base
  validates :answer_choice_id, :user_id, presence: true

  validate :not_duplicate_response
  validate :author_cannot_respond

  def author_cannot_respond
    if question.poll.author.id == self.user_id
      errors[:user_id] << "author cannot respond to own poll"
    end
  end

  def not_duplicate_response
    if respondent_already_answered?
      errors[:user_id] << "respondent has already answered this question"
    end
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  belongs_to :respondent,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  belongs_to :answer_choice,
    foreign_key: :answer_choice_id,
    primary_key: :id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question
end
