class Customer < ApplicationRecord
  has_many :customers_subscriptions
  has_many :subscriptions, through: :customers_subscriptions

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :address, presence: true
end
