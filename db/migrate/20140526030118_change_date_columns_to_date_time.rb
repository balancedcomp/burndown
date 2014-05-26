class ChangeDateColumnsToDateTime < ActiveRecord::Migration
  def change
    change_column :sprints, :start_date, :datetime
    change_column :iterations, :date, :datetime
  end
end
