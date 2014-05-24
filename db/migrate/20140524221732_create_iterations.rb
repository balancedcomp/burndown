class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.date :date
      t.decimal :points_completed
      t.integer :sprint_id

      t.timestamps
    end
  end
end
