class AddNameToDiagnoses < ActiveRecord::Migration[6.1]
  def change
    add_column :diagnoses, :name, :string
  end
end
