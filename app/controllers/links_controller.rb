class LinksController < ApplicationController

 

  def new
    @link = Link.new
    @hooks = Hook.find_by user: @current_user.id
    
  end

  def create
    @hooks = Hook.find_by user: @current_user.id
    @hook = Hook.find params[:link][:hook_id]
    @tag = Tag.create(
      name: params[:link][:tag_id]
    ) 
    @link = Link.new link_params
    @link.icon = create_icon @link.url
    @link.hooks << @hook
    @link.tags << @tag
    @link.save
    if @link.persisted? #does thius now have an id
      redirect_to hooks_path
    else
      render :new
    end

  end #end create

  def index
    @links = Link.all
  end

  def show
    @link = Link.find params[:id]
    # @favicon_link = @link.url + '/favicon.ico'
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

  # def find_ico url#finds an icon for the website
  #   found_url = false
  #   favicon_url = Hash.new{}
    
    
  #   nokogiri_object = Nokogiri::HTML(open(url)) 
  #   nokogiri_object.css('link').each do |link|
  #       if %['shortcut icon', 'icon', 'shortcut'].include?(link['rel'])
  #         found_url = true
  #         favicon_url << [URI::join(url, link['href']).to_s, (link['sizes'].split rescue [])]
  #       end
      
  #     favicon_url << [URI::join(url, '/favicon.ico').to_s, []] unless found_url
  #   end #end each

# end #end find_ico
  private

  def create_icon url 
    "#{url}" + "/favicon.ico"
  end #end create_icon
  #Establish what is expected and allowed in a links form
  def link_params

    params.require(:link).permit(:name, :url, :color, :notes, :icon, :nsfw, :image)
  end

  


end #Links_controller
