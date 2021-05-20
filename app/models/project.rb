class Project < ApplicationRecord
    belongs_to :creator
    has_many :project_artists
    has_many :artists, through: :project_artists
    has_many :project_specialties
    has_many :specialties, through: :project_specialties
    
    validates :name, presence: true
    validates :deadline, presence: true
    validates :description, presence: true
    validate :future_date 

    def self.search_by_location(search)
        if search
            search_location = search
            if self.where(location: search_location)
                self.where(location: search_location)
            else 
                Project.all
            end 
        else 
            Project.all
        end 
    end

    def self.all_locations
        self.all.map{|proj| proj.location}.uniq
    end
    
    def future_date
        if self.deadline.present? && self.deadline < Date.today
            errors.add(:deadline, "must be a date in the future")
        end 
    end

end
