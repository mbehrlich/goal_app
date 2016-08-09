class Goal < ActiveRecord::Base

  belongs_to :user

  has_many :comments,
    as: :commentable

  has_many :cheers

  validates :body, :user_id, presence: true


  def cheer_count
    @cheer_count ||= self.cheers.count
  end
  
end
