class Cheer < ActiveRecord::Base

  validates :cheerer_id, :goal_id, presence: true

  belongs_to :goal

  belongs_to :cheerer,
    primary_key: :id,
    foreign_key: :cheerer_id,
    class_name: :User



end
