class SuperAdminDashboardController < ApplicationController
    before_action :authenticate_user!
    layout 'super_admin_dashboard'
    def index
    end
    
end
