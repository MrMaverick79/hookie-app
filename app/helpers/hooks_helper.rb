module HooksHelper
  
    def show_icon link #take a link and shows the icon if available
     
       if l.icon?
                    
                  
        <% if l.url[0..3] == 'http' %>
           <% if (l.url =~ URI::regexp) %>
                  <%= image_tag l.icon %>
            <% else %>
                <%= image_tag 'dot.png'%>
            <% end  %>
        <% else %>
            <% url =  'https://' + l.icon %>
            <% begin open(url).status[1] == 'OK'  %>
            <% rescue  %>
                <%= image_tag 'dot.png'%>
                  
            <% else %>
                <%= image_tag url %>
            <% end  %>
        <% end  %>
    <% else %>
        <%= image_tag 'dot.png'%>
    <% end  %>
    
    def site_icon_link site
        if site[0..3]!= 'http'
            site =  "https://" + site
        end
        icon_link = nil
      
        
        icon_link = site + '/favicon.ico'
        
        @icon_link
    
    end


end #end links helper
