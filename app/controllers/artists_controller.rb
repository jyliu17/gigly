class ArtistsController < ApplicationController
    skip_before_action :authorized_creator

    def index
        @artists = Artist.all
        @columns = index_splitter(@artists)
        if params[:search_by_rate]
            @artists = Artist.search_by_rate(params[:search_by_rate])
            @columns = index_splitter(@artists)
        elsif params[:search_by_location]
            @artists = Artist.search_by_location(params[:search_by_location])
            @columns = index_splitter(@artists)
        elsif params[:search_by_specialty]
            @artists = Artist.search_by_specialty(params[:search_by_specialty])
            @columns = index_splitter(@artists)
        end
    end 


    def new
        @artist = Artist.new
    end

    def show
        @artist = Artist.find(params[:id])
        cookies[:add_artist_id] = @artist.id
    end

    def create
        @artist = Artist.create(artist_params)
         
        if @artist.valid?
            cookies[:login_id] = @artist.id
            redirect_to new_artist_specialty_path
        else
            flash[:errors] = @artist.errors.full_messages
            redirect_to new_artist_path
        end
    end


    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.find(params[:id])
        @artist.update(artist_params)
        @artist.save(:validate => false)

        redirect_to artist_path(@artist)
    end

    def destroy
        @artist = Artist.find(params[:id])
        @artist.destroy

        redirect_to artists_path
    end


    private

    def artist_params
        params.require(:artist).permit(:first_name, :last_name, :email, :password, :bio, :rate, :location, :search_by_rate, :search_by_location)
    end


end
