class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_for_admin, :only => [:index]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
     session[:user_id] = @user.id
     redirect_to new_project_path # Redirect to home if the account is valid
    else
     render :new # Let them retry the form again
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
