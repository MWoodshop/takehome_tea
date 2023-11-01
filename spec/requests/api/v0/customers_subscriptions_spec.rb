require 'rails_helper'

# Happy Path
RSpec.describe 'Api::V0::CustomersSubscriptions', type: :request do
  before(:each) do
    @subscription = Subscription.create!(title: 'Test Subscription', price: 10.00, status: 'active',
                                         frequency: 'weekly')
    @subscription2 = Subscription.create!(title: 'Test Subscription 2', price: 10.00, status: 'active',
                                          frequency: 'weekly')
    @customer = Customer.create!(first_name: 'John', last_name: 'Doe', email: 'jdoe@test.com', address: '123 Main St')
    @customer2 = Customer.create!(first_name: 'Jane', last_name: 'Smith', email: 'jsmith@test.com',
                                  address: '456 Main St')
    @customers_subscription = CustomersSubscription.create!(customer_id: @customer.id,
                                                            subscription_id: @subscription.id, status: 'active')
  end

  describe 'GET /customers_subscriptions/by_subscription/:subscription_id' do
    it 'returns a list of customers by subscription' do
      get "/api/v0/customers_subscriptions/by_subscription/#{@subscription.id}"
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(1)
      expect(json_response.first['subscription_id']).to eq(@subscription.id)
      expect(json_response.first['customer_id']).to eq(@customer.id)
    end
  end

  describe 'GET /customers_subscriptions/by_customer/:customer_id' do
    it 'returns a list of subscriptions by customer' do
      get "/api/v0/customers_subscriptions/by_customer/#{@customer.id}"
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(1)
      expect(json_response.first['subscription_id']).to eq(@subscription.id)
      expect(json_response.first['customer_id']).to eq(@customer.id)
    end
  end

  describe 'POST /customers_subscriptions/:customer_id/:subscription_id' do
    it 'add a customer to a subscription by creating a new record' do
      post "/api/v0/customers_subscriptions/#{@customer2.id}/#{@subscription2.id}"
      expect(response).to have_http_status(:created)
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to eq('active')
    end

    it 'add a customer to a subscription by updating status in an existing record' do
      post "/api/v0/customers_subscriptions/#{@customer2.id}/#{@subscription2.id}"
      post "/api/v0/customers_subscriptions/#{@customer2.id}/#{@subscription2.id}"
      expect(response).to have_http_status(:created)
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to eq('active')
    end
  end

  describe 'POST /customers_subscriptions/:customer_id/:subscription_id/cancel' do
    it 'cancels a subscription' do
      post "/api/v0/customers_subscriptions/#{@customer2.id}/#{@subscription2.id}"
      post "/api/v0/customers_subscriptions/#{@customer2.id}/#{@subscription2.id}/cancel"
      expect(response).to have_http_status(:ok)
    end
  end
end

# Sad Path
RSpec.describe 'Api::V0::CustomersSubscriptions', type: :request do
  before(:each) do
    @subscription = Subscription.create!(title: 'Test Subscription', price: 10.00, status: 'active',
                                         frequency: 'weekly')
    @subscription2 = Subscription.create!(title: 'Test Subscription 2', price: 10.00, status: 'active',
                                          frequency: 'weekly')
    @customer = Customer.create!(first_name: 'John', last_name: 'Doe', email: 'jdoe@test.com', address: '123 Main St')
    @customer2 = Customer.create!(first_name: 'Jane', last_name: 'Smith', email: 'jsmith@test.com',
                                  address: '456 Main St')
    @customers_subscription = CustomersSubscription.create!(customer_id: @customer.id,
                                                            subscription_id: @subscription.id, status: 'active')
  end

  describe 'POST /customers_subscriptions/:customer_id/:subscription_id' do
    it 'returns unprocessable entity status' do
      post '/api/v0/customers_subscriptions/' # {@customer2.id}/#{@subscription2.id}""
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'POST /customers_subscriptions/:customer_id/:subscription_id/cancel' do
    it 'returns a not found status' do
      post '/api/v0/customers_subscriptions/invalid_id/invalid_id/cancel'
      expect(response).to have_http_status(:not_found)
    end
  end
end
