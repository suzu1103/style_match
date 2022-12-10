class RenameFollowingIdColumnToFollowRelations < ActiveRecord::Migration[6.1]
  def change
    rename_column :follow_relations, :following_id, :followed_id
  end
end
