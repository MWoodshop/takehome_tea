require 'rails_helper'

# Happy Path
RSpec.describe 'Api::V0::Customers', type: :request do
  before(:each) do
    @customer = Customer.create!(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com',
                                 address: '123 Main St')
  end

  describe 'GET /index' do
    it 'returns a list of customers' do
      get api_v0_customers_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    it 'returns a customer' do
      get api_v0_customer_path(@customer)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    it 'creates a new customer' do
      post api_v0_customers_path,
           params: { customer: { first_name: 'Jane', last_name: 'Smith', email: 'jane.smith@example.com',
                                 address: '456 Sunny Street' } }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PATCH /update' do
    it 'updates a customer' do
      patch api_v0_customer_path(@customer),
            params: { customer: { first_name: 'New', last_name: 'Name', email: 'new_name@test.com' } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /destroy' do
    it 'deletes a customer' do
      delete api_v0_customer_path(@customer)
      expect(response).to have_http_status(:ok)
    end
  end
end

# Sad Path
RSpec.describe 'Api::V0::Customers', type: :request do
  before(:each) do
    @customer = Customer.create!(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com',
                                 address: '123 Main St')
  end

  describe 'GET /show' do
    it 'returns a not found status' do
      get api_v0_customer_path(id: 'non-existent-id')
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /create' do
    it 'returns unprocessable_entity status' do
      post api_v0_customers_path, params: { customer: { first_name: '', last_name: '', email: '', address: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH /update' do
    it 'returns unprocessable_entity status' do
      patch api_v0_customer_path(@customer),
            params: { customer: { first_name: '', last_name: '', email: '', address: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /destroy' do
    before do
      allow_any_instance_of(Customer).to receive(:destroy).and_return(false)
    end

    it 'returns an unprocessable_entity status' do
      delete api_v0_customer_path(@customer)
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns a not found status' do
      delete api_v0_customer_path(id: 'non-existent-id')
      expect(response).to have_http_status(:not_found)
    end
  end
end
