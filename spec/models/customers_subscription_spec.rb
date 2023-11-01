require 'rails_helper'

RSpec.describe CustomersSubscription, type: :model do
  describe 'before_create callback' do
    it 'should set default status to active' do
      customer = Customer.create!(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com',
                                  address: '123 Main St')
      subscription = Subscription.create!(title: 'Monthly Tea', price: 15.99, status: 'active', frequency: 'monthly')

      cs = CustomersSubscription.create!(customer:, subscription:)

      expect(cs.status).to eq('active')
    end
  end
end
