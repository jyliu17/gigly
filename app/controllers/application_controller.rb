class ApplicationController < ActionController::Base
    before_action :find_current_creator
    before_action :authorized_creator
    before_action :find_current_project
    before_action :find_current_artist
    before_action :hire_artist

    def find_current_creator
        @current_creator = Creator.find_by(id: cookies[:creator_id])
    end

    def authorized_creator
        redirect_to new_creator_path unless @current_creator
    end

    def find_current_project
        @current_project = Project.find_by(id: cookies[:project_id])
    end

    def find_current_artist
        @current_artist = Artist.find_by(id: cookies[:artist_id])
    end

    def hire_artist
        @hire_artist = Artist.find_by(id: cookies[:add_artist_id])
    end

    def index_splitter(objects)
        row_counter = 0
        col1 = []
        col2 = []
        col3 = []
        objects.each do |art|
            if row_counter == 0
                col1 << art
                row_counter += 1
            elsif row_counter == 1
                col2 << art
                row_counter += 1
            elsif row_counter == 2
                col3 << art
                row_counter = 0
            end
        end

        columns = [col1, col2, col3]
        columns
    end
end
