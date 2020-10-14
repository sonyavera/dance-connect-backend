class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  
  def profile
    render json: { user: UserSerializer.new(current_user), avatar: url_for(current_user.avatar) }, status: :accepted
  end
 
  def create
    # user = User.create(user_params)
    # user.avatar.attach(user_params[:avatar])
    user = User.create(first_name: params[:first_name], 
                        last_name: params[:last_name],
                        username: params[:username],
                        password: params[:password],
                        account_type: params[:account_type]
                      )
    user.avatar.attach(params[:avatar])
    if user.valid?
      token = encode_token({ user_id: user.id })
      render json: { user: UserSerializer.new(user), jwt: token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    byebug
    # updated_user = current_user.update_attributes(params[:user_params])
    updated_user = current_user.update_attributes(params[:user])
    render json: {user: updated_user}
  end
 
  private
 
  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :username, :password, :account_type, :avatar)
  # end

end