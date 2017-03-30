class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :task, foreign_key: true

      t.timestamps
    end
    add_index :tasks, [:id, :created_at]
  end
end