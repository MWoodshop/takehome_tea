class Subscription < ApplicationRecord
  has_many :subscriptions_teas
  has_many :teas, through: :subscriptions_teas
  has_many :customers_subscriptions
  has_many :customers, through: :customers_subscriptions
end
