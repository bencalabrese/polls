class Poll < ActiveRecord::Base
  validates :title, :author, presence: true

  belongs_to :user,
    foreign_key: :author,
    primary_key: :user_name,
    class_name: :User

  has_many :questions,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: :Question
end
