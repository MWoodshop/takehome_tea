# Takehome Tea

## Overview

This is a Rails API for a Tea Subscription service. The API allows you to manage customers, teas, and subscriptions.

## Requirements

* Ruby 3.2.2
* Rails 7.0.8
* PostgreSQL 14.9

## Gems

Testing Only:

* rspec-rails 5.1.2
* shoulda-matchers 5.3.0
* simplecov 0.22.0

## Installation

1. Clone the repository

   ```
   git clone https://github.com/MWoodshop/takehome_tea.git
   ```
2. Navigate to the project directory

   ```
   cd takehome_tea
   ```
3. Install dependencies

   ```
   bundle install
   ```
4. Setup database

   ```
   rails db:create db:migrate
   ```

## API Endpoints

### Base URL

/api/v0

### Customers

Get All Customers

> URL: /customers
>
> Method: GET

Get a Specific Customer

> URL: /customers/:customer_id
>
> Method: GET

Create New Customer

> URL: /customers
>
> Method: POST
>
> Data Params: 'first_name', 'last_name', 'email', 'address'

Edit an Existing Customer

> URL: /customers/:customer_id
>
> Method: PATCH or PUT
>
> Data Params: 'first_name', 'last_name', 'email', 'address' (all optional)

Delete a Customer

> URL: /customers/:customer_id
>
> Method: DELETE

### Teas

Get All Teas

> URL: /teas
>
> Method: GET

Get a Specific Tea

> URL: /teas/:tea_id
>
> Method: GET

Create New Tea

> URL: /teas
>
> Method: POST
>
> Data Params: 'title', 'description', 'temperature', 'brewtime'

Edit an Existing Tea

> URL: /teas/:tea_id
>
> Method: PATCH or PUT
>
> Data Params: 'title', 'description', 'temperature', 'brewtime' (all optional)

Delete a Tea

> URL: /teas/:tea_id
>
> Method: DELETE

### Subscriptions

Get All Subscriptions

> URL: /subscriptions
>
> Method: GET

Get a Specific Subscription

> URL: /subscriptions/:subscription_id
>
> Method: GET

Create New Subscription

> URL: /subscriptions
>
> Method: POST
>
> Data Params: 'title', 'price', 'status', 'frequency'

Edit an Existing Subscription

> URL: /subscriptions/:subscription_id
>
> Method: PATCH or PUT
>
> Data Params: 'title', 'price', 'status', 'frequency' (all optional)

Delete a Subscription

> URL: /subscriptions/:subscription_id
>
> Method: DELETE

### Subscription Teas

Get All Teas by Subscription

> URL: /subscriptions/:subscription_id/teas
>
> Method: GET
>
> Params: subscription_id

Add Tea to Subscription

> URL: /subscriptions/:subscription_id/teas/:tea_id
>
> Method: POST
>
> Params: subscription_id, tea_id

Remove a Tea from Subscription

> URL: /subscriptions/:subscription_id/teas/:tea_id
>
> Method: POST
>
> Params: subscription_id, tea_id

### Customer Subscriptions

Get All Subscriptions by Customer (both active and inactive)

> URL: /customers_subscriptions/by_customer/:customer_id
>
> Method: GET
>
> Params: customer_id

Get All Customers by Subscription

> URL: /customers_subscriptions/by_subscription/:subscription_id
>
> Method: GET
>
> Params: subscription_id

Add Customer to a Subscription

> URL: /customers_subscriptions/:customer_id/:subscription_id
>
> Method: POST
>
> Params: customer_id, subscription_id

Remove a Customer from a Subscription

> URL: /customers_subscriptions/:customer_id/:subscription_id/cancel
>
> Method: POST
>
> Params: customer_id, subscription_id


## Testing

To run the test suite, execute

```
bundle exec rspec
```
