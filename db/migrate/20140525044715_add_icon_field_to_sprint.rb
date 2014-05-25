class AddIconFieldToSprint < ActiveRecord::Migration
  def change
    add_column :sprints, :icon, :string
  end
end
