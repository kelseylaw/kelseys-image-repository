class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    # Returns the User that is currently logged in, nil otherwise
    def current_user
        if session["user_id"]
            User.find(session["user_id"])
        end
    end

    # Returns true is any User is logged in, false otherwise
    def logged_in?
        !current_user.nil?
    end
end
