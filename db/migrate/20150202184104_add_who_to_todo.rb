class AddWhoToTodo < ActiveRecord::Migration
  def change
  	add_column :todos, :who, :string
  end
end
