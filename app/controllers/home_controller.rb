class HomeController < ApplicationController
  layout 'application'
  def index
    if user_signed_in?
      if current_user.role.name == "Super Admin"
        redirect_to  super_admin_dashboard_index_path
      end
      if current_user.role.name == "User"
        redirect_to user_dashboard_index_path
      end
    end
  end
  def subscription
    @subscription_list = SubscriptionPlan.all
  end
end
