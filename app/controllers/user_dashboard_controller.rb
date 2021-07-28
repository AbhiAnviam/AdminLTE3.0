class UserDashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'user_dashboard'
  def index
  end

  def subscription
    @subscription_list = SubscriptionPlan.all
  end
end
