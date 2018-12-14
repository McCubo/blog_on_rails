class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  protected
    def current_user
      return unless session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
       
    def authenticate
      logged_in? || access_denied
    end
    
    def logged_in?
      current_user.is_a? User
    end
            
    def access_denied
      redirect_to login_path, notice: "Please log in to continue" and return false
    end

    # Make method available in template as a helper
    helper_method [:current_user, :logged_in?]    
end
