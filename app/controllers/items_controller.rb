class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.order(created_at: :desc)
    @genres = Genre.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = '項目建立成功'
      redirect_to items_path
    else
      flash[:alert] = '項目建立有誤'
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit  
  end

  def update
    
    if @item.update(item_params)
      flash[:notice] = '項目更新成功'
      redirect_to items_path
    else
      flash[:alert] = '項目更新有誤'
      render :edit
    end
  end

  def destroy
    @item.destroy
    flash[:notice] = '項目已經刪除'
    redirect_to items_path
  end


  private

  def item_params
    params.require(:item).permit(:title, :date, :location, :intro, :genre_id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
