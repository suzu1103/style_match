class CreatePostTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tag_relations do |t|
      t.integer :post_id
      t.integer :post_tagid

      t.timestamps
    end
  end
end
