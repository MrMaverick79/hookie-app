module HooksHelper
  
    
    def site_icon_link site
        if site[0..3]!= 'http'
            site =  "https://" + site
        end
        icon_link = nil
      
        
        icon_link = site + '/favicon.ico'
        
        @icon_link
    
    end


end #end links helper
