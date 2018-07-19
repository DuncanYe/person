class Admin::UsersController < ApplicationController

  def index
    # @users = User.order(created_at: :desc)

    @ransack = User.ransack(params[:q])
    @users =  @ransack.result(distinct: true)
  end

end
