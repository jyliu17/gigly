class ProjectArtist < ApplicationRecord
    belongs_to :artist
    belongs_to :project

    validates :artist_id, uniqueness: {scope: :project_id}
end
