class CreateCheers < ActiveRecord::Migration
  def change
    create_table :cheers do |t|
      t.integer :goal_id, null: false
      t.integer :cheerer_id, null: false
      t.timestamps null: false
    end
    add_index :cheers, :goal_id
    add_index :cheers, :cheerer_id 
  end
end
