class LinksController < ApplicationController

  def new
    @link = Link.new
  end

  def create
    @link = Link.create link_params
    if @link.persisted? #does thius now have an id
      redirect_to links_path
    else
      render :new
    end

  end #end create

  def index
    @links = Link.all
  end

  def show
    @link = Link.find params[:id]
  end

  def edit
    @link = Link.find params[:id]
  end

  def update
    @link = Link.find params[:id]

    if @link.update link_params
      redirect_to link_path(@link.id)

    else
      render :edit
    end

  end

  def destroy
    Link.destroy params[:id]
    redirect_to links_path
  end

  private
  #Establish what is expected and allowed in a links form
  def link_params

    params.require(:link).permit(:name, :url, :color, :notes, :icon, :nsfw, :image)
  end

end
