class CreateDiagnosisTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :diagnosis_tag_relations do |t|
      t.integer :diagnosis_id
      t.integer :diagnosis_tag_id

      t.timestamps
    end
  end
end
