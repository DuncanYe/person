class Admin::ItemsController < ApplicationController

  def index
    @items = Item.order(created_at: :asc).includes(:user)
  end

end
