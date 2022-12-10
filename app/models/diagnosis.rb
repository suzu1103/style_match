class Diagnosis < ApplicationRecord
  has_many :diagnosis_tag_relations, dependent: :destroy
  has_many :diagnosis_tags, through: :diagnosis_tag_relations
end
