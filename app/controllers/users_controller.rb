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
    @user = User.find params[:id]
    if   @user.id != @current_user.id #is this the users page?
      redirect_to login_path
        
    end
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params 
       
      redirect_to hooks_path(@user.id)
    else
      render :edit

    end #if
  end

  def destroy
    User.destroy params[:id]
    
    redirect_to login_path

  end

  private

  def user_params

    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  
  end #end user_params

end


