class UsersController < ApplicationController
  before_action :find_user, only: [ :show :edit, :update ]

  def show
  end

  def edit
  end

  def update
    if @user.update(params.require(:user).permit(:name, :intro))
      flash[:notice] = "個人資料更新成功"
      redirect_to @user
    else
      flash[:alert] = "個人資料更新有誤"
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
