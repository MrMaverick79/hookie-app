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
 


end
