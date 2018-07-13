class UsersController < ApplicationController
  before_action :find_user, only: [ :show, :edit, :update, :comments, :followings, :liked_items ]

  def index
    @users = User.page(params[:page]).per(9).includes(:items, :comments)
  end

  def show
    @user_items = @user.items
  end

  def edit
  end

  def update
    if @user.update(params.require(:user).permit(:name, :intro, :avatar))
      flash[:notice] = "個人資料更新成功"
      redirect_to @user
    else
      flash[:alert] = "個人資料更新有誤"
    end
  end

  def comments
    @commented_items = @user.commented_items
  end

  def followings
    @followings = @user.followings
  end

  def liked_items
    @liked_items = @user.liked_items
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
