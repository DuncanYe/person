class GenresController < ApplicationController

  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = @genre.items.all
  end
end
