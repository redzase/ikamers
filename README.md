# Ikamers API

## Project Setup

**Install all gems**:

```console
$ bundle install
```

**Update the database with new data model**:

```console
$ rake db:migrate
```

**Feed the database with default seeds**:

```console
$ rake db:seed
```

**Start the web server on `http://localhost:3000` by default**:

```console
$ rails server
```

## Usage

| HTTP verbs | Paths  | Used for |
| ---------- | ------ | --------:|
| POST | /register| Create a user|
| POST | /login   | Authenticate a user |
| GET | /products    | List all products|
| POST | /carts | Create a cart order |
| GET | /orders | List all orders |
| PUT | /order/pay/:id | Update status order |

**For details, you can see in postman collection**

## Dependencies

* Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
* SQLite3
* Bcrypt
* JWT
* Puma
* Devise
* Money-rails
* Faker
