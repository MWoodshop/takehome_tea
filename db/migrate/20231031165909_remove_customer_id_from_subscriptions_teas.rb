class RemoveCustomerIdFromSubscriptionsTeas < ActiveRecord::Migration[7.0]
  def change
    remove_column :subscriptions_teas, :customer_id, :bigint
  end
end
