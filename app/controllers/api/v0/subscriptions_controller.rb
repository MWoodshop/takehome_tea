class Api::V0::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[show update destroy]

  # GET /subscriptions
  def index
    @subscriptions = Subscription.all
    render json: @subscriptions
  end

  # GET /subscriptions/1
  def show
    render json: @subscription
  end

  # POST /subscriptions
  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      render json: @subscription, status: :created
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subscriptions/1
  def update
    if @subscription.update(subscription_params)
      render json: @subscription
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subscriptions/1
  def destroy
    if @subscription.destroy
      render json: { message: 'Subscription removed successfully' }, status: :ok
    else
      render json: { error: 'Failed to remove subscription' }, status: :unprocessable_entity
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_subscription
    @subscription = Subscription.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Subscription not found' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def subscription_params
    params.require(:subscription).permit(:title, :price, :frequency)
  end
end
