class CreateHooks < ActiveRecord::Migration[5.2]
  def change
    create_table :hooks do |t|
      t.string :title
      t.text :note
      t.string :color
      t.text :image

      t.timestamps
    end
  end
end
