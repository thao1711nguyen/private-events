class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    
    # after_filter :store_action
  
    #  def store_action
    #     return unless request.get? 
    #     if (request.path != "/users/sign_in" &&
    #         request.path != "/users/sign_up" &&
    #         request.path != "/users/password/new" &&
    #         request.path != "/users/password/edit" &&
    #         request.path != "/users/confirmation" &&
    #         request.path != "/users/sign_out" &&
    #         !request.xhr?) # don't store ajax calls
    #     store_location_for(:user, request.fullpath)
    #     end
    # end

    
    
    
      

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :confirm_password])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
    end
    
end
