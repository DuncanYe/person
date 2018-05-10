class ItemsController < ApplicationController
  def index
    @items = Item.order(created_at: :desc)
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
      flash[:alert] = '項目建議有誤'
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :date, :location, :intro)
  end
end
