class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :require_login!


  private
    def require_login!
      if !user_signed_in?
        redirect_to root_url,
          flash: { danger: 'You need to login before contiuning.' }
      end
    end

    def authorize_admin!
      require_login!

      if !current_user.admin?
        redirect_to root_url,
          flash: { danger: 'You must be an admin to do that.' }
      end
    end
end
