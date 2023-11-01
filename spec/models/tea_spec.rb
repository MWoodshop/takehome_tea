require 'rails_helper'

RSpec.describe Tea, type: :model do
  it { should have_many(:subscriptions_teas) }
  it { should have_many(:subscriptions).through(:subscriptions_teas) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:temperature) }
  it { should validate_presence_of(:brewtime) }
end
