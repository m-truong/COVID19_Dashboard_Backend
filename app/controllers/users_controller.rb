class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # Autheticate user 
  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: {status: 200, user: user}
    else
      render json: {status: 401, message: "Unauthorized"}
    end
end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Method to create token with payload
    def create_token(id, username)
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end
    # Method to return a hash
    def payload(id, username)
      {
        exp: (Time.now + 30.minutes).to_i,
        iat: Time.now.to_i,
        iss: ENV['JWT_ISSUER'],
        user: {
          id: id,
          username: username
        }
      }
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password_digest)
    end
end
