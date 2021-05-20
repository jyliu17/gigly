class CreatorsController < ApplicationController

    before_action :find_creator, only: [:show, :edit, :update, :destroy]
    skip_before_action :authorized_creator
    
    def index
        @creators = Creator.all
        @columns = index_splitter(@creators)
    end 

    def show 
    end

    def new 
        @creator = Creator.new
    end 

    def create
        @creator = Creator.create(creator_params)

        if @creator.valid? 
            cookies[:creator_id] = @creator.id
            redirect_to creator_path(@creator)
        else 
            flash[:errors] = @creator.errors.full_messages
            redirect_to new_creator_path
        end 
    end 

    def edit
    end 

    def update

        @creator.update(creator_params)

        if @creator.valid? 
            redirect_to creator_path(@creator)
        else 
            flash[:errors] = @creator.errors.full_messages
            redirect_to new_creator_path
        end 
    end 

    def destroy
        @creator.destroy
        redirect_to logout_path
    end

    
    private
        
    def creator_params
        params.require(:creator).permit(:first_name, :last_name, :email, :password, :bio, :profile_picture)
    end 

    def find_creator
        @creator = Creator.all.find(params[:id])
    end 

end
