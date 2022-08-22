class CreateDiagnoses < ActiveRecord::Migration[6.1]
  def change
    create_table :diagnoses do |t|
      t.integer :customer_id
      t.text :question

      t.timestamps
    end
  end
end
