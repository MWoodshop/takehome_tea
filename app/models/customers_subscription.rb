class CustomersSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription

  before_create :set_default_status

  private

  def set_default_status
    self.status ||= 'active'
  end
end
