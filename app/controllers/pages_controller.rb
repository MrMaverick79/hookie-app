class PagesController < ApplicationController
  before_action :fetch_user  #This will run in all controllers, but can be controlled with 'except' and 'only
  
  def home
      if @current_user.present?
        redirect_to hooks_path
      else
        redirect_to login_path
      end
  end
end
