class Api::V0::SubscriptionsTeasController < ApplicationController
  # GET /subscriptions/:subscription_id/teas
  def index
    subscription_id = params[:subscription_id]

    # Find all teas associated with the given subscription
    teas = SubscriptionsTea.where(subscription_id:).map do |subscription_tea|
      Tea.find(subscription_tea.tea_id)
    end

    render json: teas, status: :ok
  end

  # POST /subscriptions/:subscription_id/teas/:tea_id
  def create
    subscription_id = params[:subscription_id]
    tea_id = params[:tea_id]

    # Create a new entry in the subscriptions_teas table
    SubscriptionsTea.create!(subscription_id:, tea_id:)

    render json: { message: 'Tea added to subscription successfully' }, status: :created
  end

  # DELETE /subscriptions/:subscription_id/teas/:tea_id
  def destroy
    subscription_id = params[:subscription_id]
    tea_id = params[:tea_id]

    # Find the entry in the subscriptions_teas table and delete it
    subscription_tea = SubscriptionsTea.find_by(subscription_id:, tea_id:)

    if subscription_tea
      subscription_tea.destroy
      render json: { message: 'Tea removed from subscription successfully' }, status: :ok
    else
      render json: { error: 'Not found' }, status: :not_found
    end
  end
end
