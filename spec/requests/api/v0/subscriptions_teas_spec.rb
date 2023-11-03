require 'rails_helper'

# Happy Path
RSpec.describe 'Api::V0::SubscriptionsTeas', type: :request do
  before(:each) do
    @subscription = Subscription.create!(title: 'Test Subscription', price: 10.00,
                                         frequency: 'weekly')
    @tea = Tea.create!(title: 'Test Tea', description: 'A Tea for Testing!', temperature: 90, brewtime: 120)
    @tea2 = Tea.create!(title: 'Test Tea 2', description: 'A Tea for Testing Twice!', temperature: 90, brewtime: 120)
    @subscriptions_tea = SubscriptionsTea.create!(subscription_id: @subscription.id, tea_id: @tea.id)
  end

  describe 'GET /index' do
    it 'returns a list of all teas associated to a subscription' do
      get api_v0_subscription_teas_path(@subscription)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    it 'adds a tea to a subscription' do
      post "/api/v0/subscriptions/#{@subscription.id}/teas/#{@tea.id}"
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq('Tea added to subscription successfully')
    end
  end

  describe 'DELETE /api/v0/subscriptions/:subscription_id/teas/:tea_id' do
    it 'deletes a tea from a subscription' do
      delete "/api/v0/subscriptions/#{@subscription.id}/teas/#{@tea.id}"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['message']).to eq('Tea removed from subscription successfully')
    end
  end
end

# Sad Path
RSpec.describe 'Api::V0::SubscriptionsTeas', type: :request do
  before(:each) do
    @subscription = Subscription.create!(title: 'Test Subscription', price: 10.00,
                                         frequency: 'weekly')
    @tea = Tea.create!(title: 'Test Tea', description: 'A Tea for Testing!', temperature: 90, brewtime: 120)
    @tea2 = Tea.create!(title: 'Test Tea 2', description: 'A Tea for Testing Twice!', temperature: 90, brewtime: 120)
    @subscriptions_tea = SubscriptionsTea.create!(subscription_id: @subscription.id, tea_id: @tea.id)
  end

  describe 'DELETE /destroy' do
    it 'returns a not found status' do
      delete '/api/v0/subscriptions/invalid_id/teas/invalid_id'
      expect(response).to have_http_status(:not_found)
    end
  end
end
