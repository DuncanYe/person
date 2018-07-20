class RegistersController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @register = @item.registers.build(params_register)
    @register.user = current_user

    if @register.save
      flash[:notice] = "報名成功"
    else
      flash[:alert] = @register.errors.full_messages.to_sentence
    end
      redirect_back(fallback_location: root_path)
  end

  private

  def params_register
    params.require(:register).permit(:content)
  end

end
