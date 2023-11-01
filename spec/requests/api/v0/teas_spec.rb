require 'rails_helper'

# Happy Path
RSpec.describe 'Api::V0::Teas', type: :request do
  before(:each) do
    @tea = Tea.create!(title: 'Test Tea', description: 'A Tea for Testing!', temperature: 200, brewtime: 5)
  end

  describe 'GET /index' do
    it 'returns a list of teas' do
      get api_v0_teas_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    it 'returns a tea' do
      get api_v0_tea_path(@tea)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    it 'creates a new tea' do
      post api_v0_teas_path,
           params: { tea: { title: 'Second Test Tea', description: 'This is a second tea with which to test!',
                            temperature: 200, brewtime: 5 } }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PATCH /update' do
    it 'updates a tea' do
      patch api_v0_tea_path(@tea),
            params: { tea: { title: 'Second Test Tea', description: 'This is a second tea with which to test!',
                             temperature: 200, brewtime: 10 } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /destroy' do
    it 'deletes a tea' do
      delete api_v0_tea_path(@tea)
      expect(response).to have_http_status(:ok)
    end
  end
end

# Sad Path
RSpec.describe 'Api::V0::Teas', type: :request do
  before(:each) do
    @tea = Tea.create!(title: 'Test Tea', description: 'A Tea for Testing!', temperature: 200, brewtime: 5)
  end

  describe 'GET /show' do
    it 'returns a not found status' do
      get api_v0_tea_path(id: 'non-existent-id')
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /create' do
    it 'returns unprocessable_entity status' do
      post api_v0_teas_path, params: { tea: { title: '', description: '', temperature: '', brewtime: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH /update' do
    it 'returns unprocessable_entity status' do
      patch api_v0_tea_path(@tea),
            params: { tea: { title: '', description: '', temperature: '', brewtime: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /destroy' do
    before do
      allow_any_instance_of(Tea).to receive(:destroy).and_return(false)
    end

    it 'returns an unprocessable_entity status' do
      delete api_v0_tea_path(@tea)
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns a not found status' do
      delete api_v0_tea_path(id: 'non-existent-id')
      expect(response).to have_http_status(:not_found)
    end
  end
end
