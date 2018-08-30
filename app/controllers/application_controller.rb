class ApplicationController < ActionController::Base
    before_action :authenticate_user!, :set_current_user
    protect_from_forgery with: :null_session

    def set_current_user
        User.current = current_user
    end
end
