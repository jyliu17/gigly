class ReviewsController < ApplicationController
    skip_before_action :authorized_creator

    def index
    end 

    def show
        @reviews = @hire_artist.reviews
    end 

    def new
        @review = Review.new
    end

    def create
        @current_creator.reviews << Review.create(artist_id: @hire_artist.id)
        if @current_creator.reviews.last.update(review_params)
            @current_creator.reviews.last.update(review_params)
            redirect_to artist_path(@hire_artist)
        else
            flash[:errors] = @current_creator.reviews.last.errors.full_messages
            redirect_to new_review_path
        end
    end

    def artist_reviews
        #byebug
        @reviews = Review.all.where(params[cookies[:add_artist_id]])
    end 

    private

    def review_params
        params.require(:review).permit(:title, :description, :rating, :artist_id)
    end

end