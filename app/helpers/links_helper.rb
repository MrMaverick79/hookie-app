module LinksHelper
   

    def show_hook_on_select link

        if link.hooks.first == nil
            return
        else
            link.hooks.first.title
        end

    end

end
