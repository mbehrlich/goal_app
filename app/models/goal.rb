class Goal < ActiveRecord::Base

  belongs_to :user

  has_many :comments,
    as: :commentable

  validates :body, :user_id, presence: true
end
