class SessionsController < ApplicationController
    skip_before_action :authorized_creator, only: [:new, :creator_login]
    
    def new
    end

    def logout
        cookies.delete(:creator_id)
        cookies.delete(:artist_id)
        cookies.delete(:project_id)
        redirect_to new_creator_login_path
    end

    def creator_login
        creator = Creator.find_by(email: params[:session][:email])

        if creator && creator.authenticate(params[:session][:password])
            cookies[:creator_id] = creator.id
            redirect_to creator_path(creator)
        else
            flash[:errors] = "Username or Password does not match" 
            redirect_to new_creator_login_path
        end 
    end 

    def artist_login
        artist = Artist.find_by(email: params[:session][:email])

        if artist && artist.authenticate(params[:session][:password])
            cookies[:artist_id] = artist.id
            redirect_to artist_path(artist)
        else
            flash[:login_errors] = "Username or Password does not match" 
            redirect_to new_artist_login_path
        end 
    end 
    
end