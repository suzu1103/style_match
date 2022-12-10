class DiagnosisTagRelation < ApplicationRecord
  belongs_to :diagnosis
  belongs_to :diagnosis_tag
end
