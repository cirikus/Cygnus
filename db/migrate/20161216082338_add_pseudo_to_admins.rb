class AddPseudoToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :pseudo, :string
  end
end
