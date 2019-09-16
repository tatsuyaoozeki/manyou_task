class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :content
      t.datetime :deadline, null: false
      t.integer :status, null: false, default: 0
      t.integer :priority, null: false, default: 1
      t.timestamps
    end
    add_index :tasks, [:name, :status]
  end
end
