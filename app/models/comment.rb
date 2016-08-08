class Comment < ActiveRecord::Base

  validates :body, length: { minimum: 1}

  belongs_to :commentable,
    polymorphic: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

end
