class AddPrimaryKeyToSubscriptionsTeas < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions_teas, :id, :primary_key
  end
end
