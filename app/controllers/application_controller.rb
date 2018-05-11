class ApplicationController < ActionController::Base

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = '網頁尚未建立成功'
      redirect_to root_path
    end
  end
end
