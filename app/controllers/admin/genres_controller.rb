class Admin::GenresController < ApplicationController
  before_action :authenticate_admin
  before_action :find_genre, only: [:update, :destroy ]
  def index
    @genres = Genre.order(created_at: :desc)
    if params[:id]
      @genre = Genre.find(params[:id])
    else
      @genre = Genre.new
    end
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = '成功建立活動類型' 
      redirect_to admin_genres_path
    else
      @genres = Genre.order(created_at: :desc)
      render :index
    end
  end

  def update
    if @genre.update(genre_params)
      flash[:notice] = '成功更新活動類型' 
      redirect_to admin_genres_path
    else
      @genres = Genre.order(created_at: :desc)
      render :index
    end
  end

  def destroy
    @genre.destroy
    flash[:notice] = '活動類型已刪除'
    redirect_to admin_genres_path
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def find_genre
    @genre = Genre.find(params[:id])
  end

end
