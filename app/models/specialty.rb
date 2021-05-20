class Specialty < ApplicationRecord
    has_many :artist_specialties
    has_many :artists, through: :artist_specialties

end
