class CreateDiagnosisTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :diagnosis_tag_relations do |t|
      t.references :diagnosis, null: false, foreign_key: true
      t.references :diagnosis_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
