class SuperAdmin::SubscriptionPlansController < ApplicationController
  before_action :authenticate_user!
  layout 'super_admin_dashboard'
  def index
    @subscriptions = SubscriptionPlan.all
  end

  def new
    @subscription = SubscriptionPlan.new
  end

  def create
    @subscription = SubscriptionPlan.new(subscription_params)

    if @subscription.save
      redirect_to super_admin_subscription_plans_path, :flash => { :success => "New Plan Added Successfully" }
    else
      render :new, :flash => {:error => "Something Went Wrong" }
    end
  end
  def show
    @subscription = SubscriptionPlan.find(params[:id])
  end

  def edit
    @subscription = SubscriptionPlan.find(params[:id])
  end

  def update
    @subscription = SubscriptionPlan.find(params[:id])

    if @subscription.update(subscription_params)
      redirect_to super_admin_subscription_plans_path,  :flash => { :success => "Plan Updated Successfully" }
    else
      render :edit, :flash => {:error => "Something Went Wrong" }
    end
  end

  def destroy
    @subscription = SubscriptionPlan.find(params[:id])
    @subscription.destroy

    redirect_to super_admin_subscription_plans_path
  end

  private
    def subscription_params
      params.require(:subscription_plan).permit(:plan_name, :price)
    end
end
