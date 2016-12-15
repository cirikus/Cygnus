class ChangeColumnNameOnTasks < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :dateRec, :recorded_at
  end
end
