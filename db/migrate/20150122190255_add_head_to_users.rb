class AddHeadToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :head, :boolean, :default => false
  end
end
