class Subscription < ApplicationRecord
  has_many :subscriptions_teas
  has_many :teas, through: :subscriptions_teas
  has_many :customers_subscriptions
  has_many :customers, through: :customers_subscriptions

  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :frequency, presence: true
end
