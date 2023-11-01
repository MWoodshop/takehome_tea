class Api::V0::CustomersSubscriptionsController < ApplicationController
  # GET /customer_subscriptions/by_customer/:customer_id
  def by_customer
    customer_id = params[:customer_id]
    subscriptions = CustomersSubscription.where(customer_id:)
    render json: subscriptions
  end

  # GET /customers_subscriptions/by_subscription/:subscription_id
  def by_subscription
    subscription_id = params[:subscription_id]
    customers = CustomersSubscription.where(subscription_id:)
    render json: customers
  end

  # POST /customers_subscriptions/:customer_id/:subscription_id
  def create
    customer_id = params[:customer_id]
    subscription_id = params[:subscription_id]

    # Look for an existing record
    customer_subscription = CustomersSubscription.find_by(customer_id:, subscription_id:)

    if customer_subscription
      # Update the existing record
      customer_subscription.update(status: 'active')
    else
      # Create a new record if it doesn't exist
      customer_subscription = CustomersSubscription.new(customer_id:, subscription_id:,
                                                        status: 'active')
    end

    if customer_subscription.save
      render json: customer_subscription, status: :created
    else
      render json: customer_subscription.errors, status: :unprocessable_entity
    end
  end

  # POST /customers_subscriptions/:customer_id/:subscription_id/cancel
  def cancel_subscription
    customer_id = params[:customer_id]
    subscription_id = params[:subscription_id]

    # Find the entry in the customers_subscriptions table
    customer_subscription = CustomersSubscription.find_by(customer_id:, subscription_id:)

    if customer_subscription
      customer_subscription.update(status: 'inactive')
      render json: { message: 'Subscription cancelled successfully' }, status: :ok
    else
      render json: { error: 'Not found' }, status: :not_found
    end
  end
end
