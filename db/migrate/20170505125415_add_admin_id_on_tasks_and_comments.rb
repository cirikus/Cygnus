class AddAdminIdOnTasksAndComments < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :admin_id, :integer
    add_column :comments, :admin_id, :integer
  end
end
