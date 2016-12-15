class ChangeColumnTypeOnTasks < ActiveRecord::Migration[5.0]
 
  def change
    change_column :tasks, :recorded_at, :timestamp
  end

end
