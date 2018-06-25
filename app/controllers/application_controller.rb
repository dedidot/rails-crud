class ApplicationController < ActionController::Base

    helper_method :current_user

    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        else 
            nil
        end
    end

    def user_signed_in?
        if current_user
            true
        else
            redirect_to new_session_path, notice: "Silahkan login dahulu"
            return false
        end
    end

    def user_signed_in_check?
        if current_user
            redirect_back(fallback_location: blogs_path)
            return false
        else
            return true
        end
    end
end
