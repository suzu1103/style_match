class CreatePostTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tag_relations do |t|
      t.references :post, foreign_key: true
      t.references :post_tag, foreign_key: true

      t.timestamps
    end

    add_index :post_tag_relations, [:post_id, :post_tag_id], unique: true

  end
end
