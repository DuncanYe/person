class Admin::UsersController < ApplicationController
  ALLOW_QUERIES = %w[s id_eq name_cont likes_count_gteq, role_cont ].freeze

  def index
    # @users = User.order(created_at: :desc)

    @ransack = User.ransack(ransack_params)
    @users =  @ransack.result(distinct: true)
  end

  private
  
  def ransack_params
    params.require(:q).permit(*ALLOW_QUERIES) if params[:q].present?
  end

end
