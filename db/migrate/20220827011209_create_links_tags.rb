class CreateLinksTags < ActiveRecord::Migration[5.2]
  def change
    create_table :links_tags do |t|
      t.integer :link_id
      t.integer :tag_id
    end
  end
end
