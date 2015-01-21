class AddUserIdToArts < ActiveRecord::Migration
  def change
    add_column :arts, :user_id, :integer
    add_index :arts, :user_id
  end
end
