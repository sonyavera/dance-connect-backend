class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  
  def profile
    render json: { user: UserSerializer.new(current_user), avatar: url_for(current_user.avatar) }, status: :accepted
  end
 
  def create
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
    if params[:first_name] != "null"
      current_user.update(first_name: params[:first_name])
    end
    if params[:last_name] != "null"
      current_user.update(last_name: params[:last_name])
    end
    if params[:username] != "null"
      current_user.update(username: params[:username])
    end
    if params[:password] != "null"
      current_user.update(password: params[:password])
    end
    if params[:account_type] != "null"
      current_user.update(account_type: params[:account_type])
    end
    if params[:avatar] != "null"
      current_user.avatar.purge_later
      # current_user.avatar.attach(params[:avatar])
    end
    
    render json: {user: current_user}
  end
 
  private
 
  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :username, :password, :account_type, :avatar)
  # end

end