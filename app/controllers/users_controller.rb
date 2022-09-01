class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params

    if @user.persisted?
      session[:user_id] = @user.id #log in

      #Create a 'My First Hookmark Board'

      Hook.create(
        title: "My First Hookmark!",
        note: "Add your favourite links below!",
        color: "rgb(255, 99, 71)",
        private: false,
        user_id: @user.id

      )

      redirect_to hooks_path(@user.id)
    else
      render :new

    end #if

  end #create

  def index
    redirect_to login_path
  end

  def show
    redirect_to login_path
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
       #check if a file was uploaded by the form and
    # if so, forwrd that file onto cloudinary, 
    # and then save the update back into the @user.
      if params[:user][:image].present?
        #upload and capture the response., which includes a new id.
        response = Cloudinary::Uploader.upload params[:user][:image]
        @user.image = response["public_id"]
        @user.save #do I need this?
      end
        
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


