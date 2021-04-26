class RemoveColumnKeyFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :key
  end
end
