class Tea < ApplicationRecord
  has_many :subscriptions_teas
  has_many :subscriptions, through: :subscriptions_teas

  validates :title, presence: true
  validates :description, presence: true
  validates :temperature, presence: true
  validates :brewtime, presence: true
end
