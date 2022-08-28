class HooksController < ApplicationController
  before_action :check_if_logged_in 
  
  def new
    @hook = Hook.new
  end

  def create

    #To ensure that a user cannot access Hooks that are not their own, we need ot do the following:
    @hook = Hook.new hook_params
    @hook.user_id = @current_user.id
    @hook.save #this becomes the create line

    if @hook.persisted?
      redirect_to hooks_path
    else
      render :new
    end #if

  end #end create

  def index
    @hook = Hook.new
    @hooks = Hook.all
    
  
    end

  def show
    @hook = Hook.find params[:id]
  end

  def edit
    @hook = Hook.find params[:id]
  end

  def update
    @hook = Hook.find params[:id]

    if @hook.user.id != @current_user.id
      redirect_to login_path
      #also need to stop the code, otherwise the rest of the code will run and the other redirect will thro an error
      return # so we add this return

      
    end #if



    if @hook.update hook_params

      redirect_to hook_path(@hook)
      #You can also just type 'redirect_to @mixtape'

    else
      render :edit

    end  #end if
  end #end update
         

  def destroy
    Hook.destroy params[:id]
    redirect_to hooks_path
  end

  private

  def hook_params

    params.require(:hook).permit(:title, :note, :color, :image, :user_id, :private)

  end #hook_params


end
