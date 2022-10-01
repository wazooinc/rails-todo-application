class AddAccountIdColumnToTodoItems < ActiveRecord::Migration[6.1]
  def change
    add_column :todo_items, :account_id, :bigint
  end
end
