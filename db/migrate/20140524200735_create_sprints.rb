class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :title
      t.integer :total_points
      t.date :start_date

      t.timestamps
    end
  end
end
