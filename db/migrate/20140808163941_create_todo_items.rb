class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.references :todo_list, index: true
      t.string :contect

      t.timestamps
    end
  end
end
