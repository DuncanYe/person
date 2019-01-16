class MyRegistrationsController < Devise::RegistrationsController

  # def create
  #   super
  #   if @user.persisted?
  #     UserMailer.with(user: @user).welcome_email.deliver_later
  #   end
  # end

  def create
    super
    if @user.persisted?
      UserMailer.registration_confirmation(@user).deliver_later
      flash[:alert] = "Please confirm your email address to continue"
    end
    # 如果失敗 devise 會自動噴錯
  end

  # def create
  #   binding.pry
  #   @user = User.new(params[:user])
 
  #   respond_to do |format|
  #     if @user.save
  #       # Tell the UserMailer to send a welcome email after save
  #       UserMailer.with(user: @user).welcome_email.deliver_now
 
  #       format.html { redirect_to(@user, notice: 'User was successfully created.') }
  #       format.json { render json: @user, status: :created, location: @user }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  private

  # def sign_up_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  # end

  # def after_sign_up_path_for(resource)
  #   # binding.pry
  #   if @user..email_confirmed == false
  #     "/users/sign_in"
  #   end
  # end
 
  # def after_inactive_sign_up_path_for(resource)
  #   "/users/sign_in"
  # end

end