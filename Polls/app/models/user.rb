class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true

  has_many :polls,
    foreign_key: :author,
    primary_key: :user_name,
    class_name: :Poll
end
