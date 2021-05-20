class ProjectSpecialty < ApplicationRecord
  belongs_to :project
  belongs_to :specialty

  validates :specialty_id, uniqueness: {scope: :project_id}
end
