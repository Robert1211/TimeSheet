class UsersController < ApplicationController
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


  # new copy for email start
  def create
      @user = User.new(user_params)
       respond_to do |format|
        if @user.save
          # session[:user_id] = @user.id  potrzeban linia jesli nie uzywamy poprzedniej wersji create nagorze
          # The line below is the only additional line we need in our Users controller.
          UserMailer.welcome(@user).deliver_now
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
 # end copy

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
