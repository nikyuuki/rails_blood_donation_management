class ApplicationController < ActionController::Base
  def store_action
    return unless request.get? 
    if (request.path != "/admins/sign_in" &&
        request.path != "/admins/sign_up" &&
        request.path != "/admins/password/new" &&
        request.path != "/admins/password/edit" &&
        request.path != "/uadmins/confirmation" &&
        request.path != "/admins/sign_out" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:user, request.fullpath)
    end
  end
end

class ApplicationController < ActionController::Base
   allow_browser versions: :modern

   before_action :configure_permitted_parameters, if: :devise_controller?

   # Redirect user after login based on role
   protected

   def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icnum])
    end
    protected

    def after_sign_out_path_for(resource_or_scope)
      # Redirect to the desired path after sign out
      home_index_path # or any other path you want
    end

    def after_sign_in_path_for(resource_or_scope)
      # Redirect to the desired path after sign out
      home_dashboard_path # or any other path you want
    end
end
