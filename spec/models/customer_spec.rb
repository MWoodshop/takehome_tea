require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many(:customers_subscriptions) }
  it { should have_many(:subscriptions).through(:customers_subscriptions) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:address) }
end
