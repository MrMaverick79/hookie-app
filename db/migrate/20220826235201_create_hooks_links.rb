class CreateHooksLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :hooks_links do |t|
      t.integer :hook_id
      t.integer :link_id
    end
  end
end
