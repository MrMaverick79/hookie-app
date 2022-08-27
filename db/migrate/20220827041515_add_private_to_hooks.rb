class AddPrivateToHooks < ActiveRecord::Migration[5.2]
  def change
    add_column :hooks, :private, :boolean
  end
end
