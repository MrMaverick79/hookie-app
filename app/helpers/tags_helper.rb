module TagsHelper
    def find_user tag_name 
        specific_tags = Tag.where(name: tag_name)
        specific_tags.each do |tag|
            links = tag.links
            links.each do |link|
                hooks = link.hooks
                hooks.each do |hook|
                    return hook.user.id == @current_user.id
                    
                    
                end #hooks do
            end # end links search
  
        end  # end each do tag
    end # end define owner


end
