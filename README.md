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

<details>
<summary>Get All Customers</summary>

URL: `/customers`
<br>
Method: `GET`
<br>
Response:

```json
[
    {
        "id": 1,
        "first_name": "John",
        "last_name": "Doe",
        "email": "joe@example.com",
        "address": "123 Main St, Anytown, OH, 12345",
        "created_at": "2023-10-31T20:30:34.889Z",
        "updated_at": "2023-10-31T20:30:34.889Z"
    },
    {
        "id": 2,
        "first_name": "Jane",
        "last_name": "Smith",
        "email": "jsmith@example.com",
        "address": "456 Main St, Howell, NJ, 07731",
        "created_at": "2023-10-31T20:30:34.890Z",
        "updated_at": "2023-10-31T20:30:34.890Z"
    }
]
```
<br>
</details>
<br>

<details>
<summary>Get a Specific Customer</summary>

URL: `/customers/:customer_id`
<br>
Method: `GET`
<br>
Response:

```json
{
    "id": 1,
    "first_name": "John",
    "last_name": "Doe",
    "email": "joe@example.com",
    "address": "123 Main St, Anytown, OH, 12345",
    "created_at": "2023-10-31T20:30:34.889Z",
    "updated_at": "2023-10-31T20:30:34.889Z"
}
```
<br>
</details>
<br>


<details>
<summary>Create New Customer</summary>

URL: `/customers`
<br>
Method: `POST`
<br>
Request:

```json
{
    "first_name": "Cameron",
    "last_name": "Diaz",
    "email": "cdiaz@hollywood.com",
    "address": "123 Hollywood Blvd., Hollywood, CA, 90210"
}
```
<br>

Response:

```json
{
    "id": 1,
    "first_name": "John",
    "last_name": "Doe",
    "email": "joe@example.com",
    "address": "123 Main St, Anytown, OH, 12345",
    "created_at": "2023-10-31T20:30:34.889Z",
    "updated_at": "2023-10-31T20:30:34.889Z"
}
```
<br>
</details>
<br>



<details>
<summary>Edit an Existing Customer</summary>

URL: `/customers/:customer_id`
<br>
Method: `PUT or PATCH`
<br>
Request:

```json
{
  "first_name": "NewerCameron"
}
```
<br>

Response:

```json
{
    "first_name": "NewerCameron",
    "id": 4,
    "last_name": "Diaz",
    "email": "cdiaz@hollywood.com",
    "address": "123 Hollywood Blvd., Hollywood, CA, 90210",
    "created_at": "2023-11-03T15:27:09.326Z",
    "updated_at": "2023-11-03T15:30:45.442Z"
}
```
<br>
</details>
<br>


<details>
<summary>Delete a Customer</summary>

URL: `/customers/:customer_id`
<br>
Method: `DELETE`
<br>
Response:

```json
{
    "message": "Customer removed successfully"
}
```
<br>
</details>
<br>


### Teas

<details>
<summary>Get All Teas</summary>

URL: `/teas`
<br>
Method: `GET`
<br>
Response:

```json
[
    {
        "id": 1,
        "title": "Green Tea",
        "description": "A tea made from unoxidized leaves.",
        "temperature": 80,
        "brewtime": 120,
        "created_at": "2023-10-31T20:30:34.881Z",
        "updated_at": "2023-10-31T20:30:34.881Z"
    },
    {
        "id": 2,
        "title": "Black Tea",
        "description": "Fully oxidized, black tea is the most popular type of tea.",
        "temperature": 100,
        "brewtime": 300,
        "created_at": "2023-10-31T20:30:34.882Z",
        "updated_at": "2023-10-31T20:30:34.882Z"
    }
]
```
<br>
</details>
<br>

<details>
<summary>Get a Specific Tea</summary>

URL: `/teas/:tea_id`
<br>
Method: `GET`
<br>
Response:

```json
{
    "id": 1,
    "title": "Green Tea",
    "description": "A tea made from unoxidized leaves.",
    "temperature": 80,
    "brewtime": 120,
    "created_at": "2023-10-31T20:30:34.881Z",
    "updated_at": "2023-10-31T20:30:34.881Z"
}
```
<br>
</details>
<br>


<details>
<summary>Create New Tea</summary>

URL: `/teas`
<br>
Method: `POST`
<br>
Request:

```json
{
    "title": "Blue Tea",
    "description": "Made with Star Wars Blue Milk!",
    "temperature": 90,
    "brewtime": 120
}
```
<br>

Response:

```json
{
    "id": 5,
    "title": "Blue Tea",
    "description": "Made with Star Wars Blue Milk!",
    "temperature": 90,
    "brewtime": 120,
    "created_at": "2023-11-03T15:39:55.263Z",
    "updated_at": "2023-11-03T15:39:55.263Z"
}
```
<br>
</details>
<br>



<details>
<summary>Edit an Existing Tea</summary>

URL: `/teas/:tea_id`
<br>
Method: `PUT or PATCH`
<br>
Request:

```json
{
  "title": "Newer Tea Title"
}
```
<br>

Response:

```json
{
    "title": "Newer Tea Title",
    "id": 1,
    "description": "A tea made from unoxidized leaves.",
    "temperature": 80,
    "brewtime": 120,
    "created_at": "2023-10-31T20:30:34.881Z",
    "updated_at": "2023-11-03T15:40:27.226Z"
}
```
<br>
</details>
<br>


<details>
<summary>Delete a Tea</summary>

URL: `/teas/:tea_id`
<br>
Method: `DELETE`
<br>
Response:

```json
{
    "message": "Tea removed successfully"
}
```
<br>
</details>
<br>

### Subscriptions

<details>
<summary>Get All Subscriptions</summary>

URL: `/subscriptions`
<br>
Method: `GET`
<br>
Response:

```json
[
    {
        "id": 2,
        "title": "Black Tea Subscription",
        "price": "12.5",
        "frequency": "weekly",
        "created_at": "2023-10-31T20:30:34.896Z",
        "updated_at": "2023-10-31T20:30:34.896Z"
    },
    {
        "id": 3,
        "title": "Green Tea Subscription",
        "price": "13.0",
        "frequency": "weekly",
        "created_at": "2023-10-31T20:30:34.897Z",
        "updated_at": "2023-10-31T20:30:34.897Z"
    }
]
```
<br>
</details>
<br>


<details>
<summary>Get a Specific Subscription</summary>

URL: `/subscriptions/:subscription_id`
<br>
Method: `GET`
<br>
Response:

```json
{
    "id": 1,
    "title": "Green Tea Subscription",
    "price": "16.0",
    "frequency": "monthly",
    "created_at": "2023-10-31T20:30:34.895Z",
    "updated_at": "2023-11-02T16:13:42.646Z"
}
```
<br>
</details>
<br>


<details>
<summary>Create New Subscription</summary>

URL: `/subscriptions`
<br>
Method: `POST`
<br>
Request:

```json
{
    "title": "New Test Subscription",
    "price": 15.00,
    "frequency": "monthly"
}
```
<br>

Response:

```json
{
    "id": 5,
    "title": "New Test Subscription",
    "price": "15.0",
    "frequency": "monthly",
    "created_at": "2023-11-03T15:42:42.431Z",
    "updated_at": "2023-11-03T15:42:42.431Z"
}
```
<br>
</details>
<br>



<details>
<summary>Edit an Existing Subscription</summary>

URL: `/subscriptions/:subscription_id`
<br>
Method: `PUT or PATCH`
<br>
Request:

```json
{
  "price": 16.00,
  "frequency": "monthly"
}
```
<br>

Response:

```json
{
    "price": "16.0",
    "frequency": "monthly",
    "id": 1,
    "title": "Green Tea Subscription",
    "created_at": "2023-10-31T20:30:34.895Z",
    "updated_at": "2023-11-02T16:13:42.646Z"
}
```
<br>
</details>
<br>


<details>
<summary>Delete a Subscription</summary>

URL: `/subscriptions/:subscription_id`
<br>
Method: `DELETE`
<br>
Response:

```json
{
    "message": "Subscription removed successfully"
}
```
<br>
</details>
<br>

### Subscription Teas

<details>
<summary>Get All Teas by Subscription</summary>

URL: `/subscriptions/:subscription_id/teas`
<br>
Method: `GET`
<br>
Response:

```json
[
    {
        "id": 2,
        "title": "Black Tea",
        "description": "Fully oxidized, black tea is the most popular type of tea.",
        "temperature": 100,
        "brewtime": 300,
        "created_at": "2023-10-31T20:30:34.882Z",
        "updated_at": "2023-10-31T20:30:34.882Z"
    },
    {
        "id": 3,
        "title": "Oolong Tea",
        "description": "Partially oxidized, Oolong has qualities of both green and black tea.",
        "temperature": 85,
        "brewtime": 240,
        "created_at": "2023-10-31T20:30:34.884Z",
        "updated_at": "2023-10-31T20:30:34.884Z"
    }
]
```
<br>
</details>
<br>


<details>
<summary>Add Tea to Subscription</summary>

URL: `/subscriptions/:subscription_id/teas/:tea_id`
<br>
Method: `POST`
<br>
Response:

```json
{
    "message": "Tea added to subscription successfully"
}
```
<br>
</details>
<br>


<details>
<summary>Remove a Tea from Subscription</summary>

URL: `/subscriptions/:subscription_id/teas/:tea_id`
<br>
Method: `DELETE`
<br>
Response:

```json
{
    "message": "Tea removed from subscription successfully"
}
```
<br>
</details>
<br>


### Customer Subscriptions

<details>
<summary>Get All Subscriptions by Customer (both active and inactive)</summary>

URL: `/customers_subscriptions/by_customer/:customer_id`
<br>
Method: `GET`
<br>
Response:

```json
[
    {
        "id": 1,
        "customer_id": 1,
        "subscription_id": 1,
        "created_at": "2023-10-31T20:30:34.938Z",
        "updated_at": "2023-10-31T20:30:34.938Z",
        "status": "active"
    },
    {
        "id": 2,
        "customer_id": 1,
        "subscription_id": 2,
        "created_at": "2023-10-31T20:30:34.941Z",
        "updated_at": "2023-10-31T20:30:34.941Z",
        "status": "active"
    },
    {
        "id": 3,
        "customer_id": 1,
        "subscription_id": 3,
        "created_at": "2023-10-31T20:30:34.943Z",
        "updated_at": "2023-10-31T20:30:34.943Z",
        "status": "active"
    },
    {
        "id": 4,
        "customer_id": 1,
        "subscription_id": 4,
        "created_at": "2023-10-31T20:30:34.945Z",
        "updated_at": "2023-11-01T20:40:41.259Z",
        "status": "inactive"
    }
]
```
<br>
</details>
<br>


<details>
<summary>Get All Customers by Subscription</summary>

URL: `/customers_subscriptions/by_subscription/:subscription_id`
<br>
Method: `GET`
<br>
Response:

```json
[
    {
        "id": 1,
        "customer_id": 1,
        "subscription_id": 1,
        "created_at": "2023-10-31T20:30:34.938Z",
        "updated_at": "2023-10-31T20:30:34.938Z",
        "status": "active"
    },
    {
        "id": 5,
        "customer_id": 2,
        "subscription_id": 1,
        "created_at": "2023-10-31T20:31:16.509Z",
        "updated_at": "2023-11-02T16:09:07.336Z",
        "status": "inactive"
    }
]
```
<br>
</details>
<br>


<details>
<summary>Add a Customer to a Subscription</summary>

URL: `/customers_subscriptions/:customer_id/:subscription_id`
<br>
Method: `POST`
<br>
Response:

```json
{
    "status": "active",
    "id": 5,
    "customer_id": 2,
    "subscription_id": 1,
    "created_at": "2023-10-31T20:31:16.509Z",
    "updated_at": "2023-11-03T15:52:28.782Z"
}
```
<br>
</details>
<br>


<details>
<summary>Remove a Customer from a Subscription</summary>

URL: `/customers_subscriptions/:customer_id/:subscription_id/cancel`
<br>
Method: `POST`
<br>
Response:

```json
{
    "message": "Subscription cancelled successfully"
}
```
<br>
</details>
<br>

## Testing

To run the test suite, execute

```
bundle exec rspec
```
