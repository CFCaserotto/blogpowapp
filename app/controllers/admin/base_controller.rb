module Admin
    class BaseController < ApplicationController
        before_action :check_if_admin
        private
        def check_if_admin
          if current_user.nil? || !current_user.admin?
            flash[:alert] = "You need to be an admin"
            redirect_to root_path
          end
        end
    end
end