class CreateCustomersSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :customers_subscriptions do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
