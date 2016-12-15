class AddDateRecordToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :dateRec, :date
  end
end
