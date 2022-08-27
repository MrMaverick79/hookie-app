class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :name
      t.text :url
      t.string :notes
      t.text :icon
      t.boolean :nsfw
      t.text :image

      t.timestamps
    end
  end
end
