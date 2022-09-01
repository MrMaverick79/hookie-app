module ApplicationHelper
     require 'open-uri'
     require 'uri'
    
  def create_icon url  #add route to favicon
        uri = URI.parse(url)
        base = "#{uri.scheme}://#{uri.host}"
        "#{base}" + "/favicon.ico"
    end #end create_icon

    #TODO: Make this part of the edit and create process so it is not run each time
  
  def show_icon link #take a link and shows the icon if available
     url = link.url#this url includes /favicon.ico
     url = create_icon url
     if url[0..3] != 'http' 
            image_tag 'dot.png' #in any cases where the url is not able to be searched (i.e. does not have http ), then use generic icon.
      else
          
          begin open(url).status[1] == 'OK'  #do we get a resposne from the website
          rescue #if you don't get an 'OK' reponse 
              image_tag 'dot.png'
                
          else
              image_tag url
          end  #begin
      end #if
  end #end  show_icon
 
  def show_unique_tags hook_links
    @name_list = [] 
        hook_links.each do |link|
            link.tags.each do |tag|
                if tag.name != nil #if the tag is not nil
                    unless tag.name.strip.empty? #if the tag is not an empty string
                        @name_list << tag.name 
                            
                    end #end unless
                end #if
            end #end link do 
        end #end hook links do

        if @name_list != nil #if the name list is not empty
            @name_list.uniq! #get rid of duplicates
            @name_list.sort!  #sort--because why not
        
        end #if

        @name_list #passes this back to  be iterated over

    end  #end show_unique_tags

end
