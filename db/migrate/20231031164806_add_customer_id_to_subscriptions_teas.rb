class AddCustomerIdToSubscriptionsTeas < ActiveRecord::Migration[7.0]
  def change
    add_reference :subscriptions_teas, :customer, null: false, foreign_key: true
  end
end
