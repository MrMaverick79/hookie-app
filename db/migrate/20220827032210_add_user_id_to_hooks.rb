class AddUserIdToHooks < ActiveRecord::Migration[5.2]
  def change
    add_column :hooks, :user_id, :integer
  end
end
