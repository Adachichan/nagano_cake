class Admin::GenresController < ApplicationController

  def index
    @genre_registration = Genre.new
    @genre_list = Genre.all
  end

  def create
    @genre_registration = Genre.new(genre_registration_params)
     @genre_registration.save
     redirect_to admin_genres_path
  end

  def edit
  end

  def update
  end

  private

  def genre_registration_params
    params.require(:genre).permit(:name)
  end

end
