class ProjectSpecialtiesController < ApplicationController
    skip_before_action :authorized_creator

    def new
        @project_specialty = ProjectSpecialty.new
        @projects = Project.all
        @specialties = Specialty.all
    end

    def create
        params[:project_specialty][:specialty_id].each do |spec|
            @current_project.project_specialties << ProjectSpecialty.create(specialty_id: spec)
        end

        redirect_to project_path(@current_project)
    end

    def destroy
        @project_specialty = ProjectSpecialty.find(params[:id])
        @current_project = @project_specialty.project
        @project_specialty.destroy

        redirect_to project_path(@current_project)
    end 

end
