class ArtistSpecialty < ApplicationRecord
  belongs_to :artist
  belongs_to :specialty

  validates :artist_id, uniqueness: {scope: :specialty_id}
end
