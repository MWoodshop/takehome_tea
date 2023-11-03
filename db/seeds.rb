Tea.destroy_all
Customer.destroy_all
Subscription.destroy_all
SubscriptionsTea.destroy_all
CustomersSubscription.destroy_all

# Seed Teas
teas = [
  {
    title: 'Green Tea',
    description: 'A tea made from unoxidized leaves.',
    temperature: 80,
    # Brewtime is always in seconds in the db
    brewtime: 120
  },
  {
    title: 'Black Tea',
    description: 'Fully oxidized, black tea is the most popular type of tea.',
    temperature: 100,
    brewtime: 300
  },
  {
    title: 'Oolong Tea',
    description: 'Partially oxidized, Oolong has qualities of both green and black tea.',
    temperature: 85,
    brewtime: 240
  },
  {
    title: 'Herbal Tea',
    description: 'Made from herbs, fruits, seeds, or roots.',
    temperature: 150,
    brewtime: 320
  }
]

# Populate the database with teas
teas.each do |tea|
  Tea.create!(tea)
end

puts "Seeded #{Tea.count} teas."

# Seed Customers
customers = [
  {
    first_name: 'John',
    last_name: 'Doe',
    email: 'joe@example.com',
    address: '123 Main St, Anytown, OH, 12345'
  },
  {
    first_name: 'Jane',
    last_name: 'Smith',
    email: 'jsmith@example.com',
    address: '456 Main St, Howell, NJ, 07731'
  }
]

# Populate the database with customers
customers.each do |customer|
  Customer.create!(customer)
end

puts "Seeded #{Customer.count} customers."

# Seed Subscriptions
subscriptions = [
  {
    title: 'Green Tea Subscription',
    price: 10.00,
    frequency: 'weekly'
  },
  {
    title: 'Black Tea Subscription',
    price: 12.50,
    frequency: 'weekly'
  },
  {
    title: 'Green Tea Subscription',
    price: 13.00,
    frequency: 'weekly'
  },
  {
    title: 'Oolong Tea Subscription',
    price: 11.75,
    frequency: 'weekly'
  }
]

# Populate the database with subscriptions and join table records
subscriptions.each do |subscription|
  Subscription.create!(subscription)
end

puts "Seeded #{Subscription.count} subscriptions."

# Associate teas with subscriptions
subscriptions_teas = [
  {
    subscription_id: Subscription.first.id,
    tea_id: Tea.first.id
  },
  {
    subscription_id: Subscription.second.id,
    tea_id: Tea.second.id
  },
  {
    subscription_id: Subscription.third.id,
    tea_id: Tea.third.id
  },
  {
    subscription_id: Subscription.fourth.id,
    tea_id: Tea.first.id
  }
]

# Populate the database with subscriptions_teas
subscriptions_teas.each do |subscription_tea|
  SubscriptionsTea.create!(subscription_tea)
end

puts "Seeded #{Subscription.count} subscriptions."

# Associate Customers with Subscriptions
customers_subscriptions = [
  {
    customer_id: Customer.first.id,
    subscription_id: Subscription.first.id
  },
  {
    customer_id: Customer.first.id,
    subscription_id: Subscription.second.id
  },
  {
    customer_id: Customer.first.id,
    subscription_id: Subscription.third.id
  },
  {
    customer_id: Customer.first.id,
    subscription_id: Subscription.fourth.id
  }
]

# Populate the database with customers_subscriptions
customers_subscriptions.each do |customer_subscription|
  CustomersSubscription.create!(customer_subscription)
end

puts "Seeded #{CustomersSubscription.count} customers_subscriptions."
