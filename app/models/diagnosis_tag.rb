class DiagnosisTag < ApplicationRecord
  has_many :diagnosis_tag_relations, dependent: :destroy
  has_many :diagnoses, through: :diagnosis_tag_relations, dependent: :destroy
end
