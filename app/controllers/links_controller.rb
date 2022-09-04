class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create]
  

  def new
    @link = Link.new
    @hooks = Hook.find_by user: @current_user.id
    
  end

  def create
    @hooks = Hook.find_by user: @current_user.id
    if params[:link].present? #for links coming from within the app
      @hook = Hook.find params[:link][:hook_id]
      @tags = params[:link][:tag_name]
    else  #for the extension
      @hook = Hook.find_by title: params[:hook_title]
    end
    
    


    @link = Link.new link_params
    
    ## Add https:// to the link if it is not there
    if @link.url[0..3] != 'http'
      @link.url = 'https://' + @link.url
    end 
   
    @link.hooks << @hook
    # @link.tags << @tag
    @link.save
    if @link.persisted?  # ie does this now have an id
      associate_tags @tags, @link
      @link.icon = create_icon @link.url
      @link.save 
      if params[:link].present? #internal request
        redirect_to hooks_path
      end
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
    @tags = params[:link][:tag_name]
    hook = Hook.find params[:link][:hook_id]
    
    @link.hooks << hook
    @link.save
    associate_tags @tags, @link
    if @link.update link_params 
     
      redirect_to hooks_path

    else
      render :edit
    end

  end

  def destroy
    Link.destroy params[:id]
    redirect_to hooks_path
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

  def associate_tags tags, link
    if !tags.nil?
      tags = tags.split
      tags.uniq!
      tags.each do |tag|
        
      
      existing_tag = Tag.find_by name: tag
        
          if existing_tag != nil
            existing_tag.links << link 
          else       
              new_tag = Tag.create(
                name: tag
              )
              link.tags << new_tag 
      
          end #end if
      

        
        
      end #end each do
    end #if
end #end associate tags

 
  #Establish what is expected and allowed in a links form
  def link_params
    if params[:link].present?
      params.require(:link).permit(:name, :url, :color, :notes, :icon, :nsfw, :image)
    else
      params.permit(:name, :url, :color, :notes, :icon, :nsfw, :image)
    end
  end

  


end #Links_controller
