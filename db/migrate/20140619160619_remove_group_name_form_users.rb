class RemoveGroupNameFormUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :group_name, :string
  end
end
