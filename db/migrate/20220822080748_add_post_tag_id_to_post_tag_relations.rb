class AddPostTagIdToPostTagRelations < ActiveRecord::Migration[6.1]
  def change
    add_column :post_tag_relations, :post_tag_id, :integer
  end
end
