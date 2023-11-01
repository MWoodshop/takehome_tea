require 'rails_helper'

RSpec.describe 'Api::V0::CustomersSubscriptions', type: :request do
  describe 'POST /create' do
    it 'creates a new customer subscription' do
      customer = Customer.create!(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com',
                                  address: '123 Main St')
      subscription = Subscription.create!(title: 'Monthly Tea', price: 15.99, status: 'active', frequency: 'monthly')

      post "/api/v0/customers_subscriptions/#{customer.id}/#{subscription.id}"
      expect(response).to have_http_status(:created)
    end
  end
end
