class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params

    if @user.persisted?
      session[:user_id] = @user.id #log in
      redirect_to hooks_path(@user.id)
    else
      render :new

    end #if

  end #create

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params

    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  
  end #end user_params

end


