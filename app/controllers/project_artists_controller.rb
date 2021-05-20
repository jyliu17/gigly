class ProjectArtistsController < ApplicationController
    skip_before_action :authorized_creator

    def new
        @project_artist = ProjectArtist.new
        @projects = Project.all
        @artists = Artist.all
    end

    def create
        @hire_artist.project_artists << ProjectArtist.create(project_id: params[:project_artist][:project_id])

        redirect_to project_path(params[:project_artist][:project_id])
    end
end
