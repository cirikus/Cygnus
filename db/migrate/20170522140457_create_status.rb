class CreateStatus < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.string :label
      
      t.timestamps
    end
    add_index :statuses, [:id, :created_at]
  end
end
