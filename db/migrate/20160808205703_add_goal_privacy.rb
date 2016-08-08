class AddGoalPrivacy < ActiveRecord::Migration
  def change
    add_column :goals, :private, :boolean, default: true
    add_column :goals, :completed, :boolean, default: false
  end
end
