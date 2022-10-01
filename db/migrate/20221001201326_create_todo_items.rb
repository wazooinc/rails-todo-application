class CreateTodoItems < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_items do |t|
      t.string :title
      t.boolean :is_completed

      t.timestamps
    end
  end
end
