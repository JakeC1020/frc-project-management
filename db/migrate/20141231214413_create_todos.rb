class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :task
      t.date :due
      t.boolean :done
      t.references :user, index: true

      t.timestamps
    end
  end
end
