class SessionController < ApplicationController
  def new
  end

  def create

    #check that the user is in the DB
    user = User.find_by email: params[:email]
    if user.present? && user.authenticate( params[:password] )

      session[:user_id] = user.id #Also do this when creating a new user. This remembers  the contents across page reloads/. This stores a cookie that will remmeber the session detaiuls in ahash and then reload to know what the statu s iu--they are stored in a cookie. 
      redirect_to root_path

        #credentials correct
    else
          #either user was nil (no account OR the password given did no, when encrypted match the password digest storeed for that account) 
      
        #flash will set a special message that wil only show for one page load. It is a bit like th session varible in that it uses http cookies to persist across page loads. In this case, the data only persiosts for onemore page loads, so you can show an error on the login page afterr you redirect.
        flash[:error] = "Invaild email address or password"

        #This could be used for confirmation or other mesages. Error is our key--we could use whatever we ant when calling flash.,

        redirect_to login_path   #keep the user at the login page

    end #else


  end #create 
  

  def destroy
    session[:user_id] = nil
    redirect_to login_path

  end #end destroy


end
