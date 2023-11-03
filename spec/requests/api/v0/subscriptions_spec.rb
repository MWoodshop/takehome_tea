require 'rails_helper'

# Happy Path
RSpec.describe 'Api::V0::Subscriptions', type: :request do
  before(:each) do
    @subscription = Subscription.create!(title: 'Test Subscription', price: 10.00,
                                         frequency: 'weekly')
  end

  describe 'GET /index' do
    it 'returns a list of subscriptions' do
      get api_v0_subscriptions_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    it 'returns a subscription' do
      get api_v0_subscription_path(@subscription)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    it 'creates a new subscription' do
      post api_v0_subscriptions_path,
           params: { subscription: { title: 'Second Test Subscription', price: 15.00,
                                     frequency: 'monthly' } }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PATCH /update' do
    it 'updates a subscription' do
      patch api_v0_subscription_path(@subscription),
            params: { subscription: { title: 'Third Test Subscription' } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /destroy' do
    it 'deletes a subscription' do
      delete api_v0_subscription_path(@subscription)
      expect(response).to have_http_status(:ok)
    end
  end
end

# Sad Path
RSpec.describe 'Api::V0::Subscriptions', type: :request do
  before(:each) do
    @subscription = Subscription.create!(title: 'Test Subscription', price: 'A Subscription for Testing!',
                                         frequency: 5)
  end

  describe 'GET /show' do
    it 'returns a not found status' do
      get api_v0_subscription_path(id: 'non-existent-id')
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /create' do
    it 'returns unprocessable_entity status' do
      post api_v0_subscriptions_path, params: { subscription: { title: '', price: '', frequency: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH /update' do
    it 'returns unprocessable_entity status' do
      patch api_v0_subscription_path(@subscription),
            params: { subscription: { title: '', price: '', frequency: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /destroy' do
    before do
      allow_any_instance_of(Subscription).to receive(:destroy).and_return(false)
    end

    it 'returns an unprocessable_entity status' do
      delete api_v0_subscription_path(@subscription)
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns a not found status' do
      delete api_v0_subscription_path(id: 'non-existent-id')
      expect(response).to have_http_status(:not_found)
    end
  end
end
