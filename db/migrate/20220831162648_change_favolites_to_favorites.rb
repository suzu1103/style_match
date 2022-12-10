class ChangeFavolitesToFavorites < ActiveRecord::Migration[6.1]
  def change
    rename_table :favolites, :favorites
  end
end
