class ChangeColumnNameOnAdmins < ActiveRecord::Migration[5.0]
  def change
    rename_column :admins, :firstname, :first_name
    rename_column :admins, :name, :last_name
  end
end
