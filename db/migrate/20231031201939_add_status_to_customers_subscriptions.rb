class AddStatusToCustomersSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :customers_subscriptions, :status, :string
  end
end
