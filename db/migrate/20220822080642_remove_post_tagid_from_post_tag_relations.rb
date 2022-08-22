class RemovePostTagidFromPostTagRelations < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_tag_relations, :post_tagid, :integer
  end
end
