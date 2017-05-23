class AddStatusToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :status_id, :integer
  end
end
