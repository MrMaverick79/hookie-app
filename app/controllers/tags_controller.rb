class TagsController < ApplicationController
  
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create tag_params
  end

  def index
    @tags = Tag.all
  end

  def show
    @tags = Tag.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
    Tag.destroy params[:id]
    redirect_to hook_path(@current_user.id)
  end

  private 

  def tag_params

    params.require(:tag).permit(:name)

  end

end
