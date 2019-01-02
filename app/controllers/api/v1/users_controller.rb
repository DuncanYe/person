class Api::V1::UsersController < ApiController

  def index
    @users = User.all
    # render json: { Users: @users }.to_json
    render json: {
      Users: @users.map do |user|
        {
         id: user.id,
         name: user.name
        }
      end
     }
  end

end
