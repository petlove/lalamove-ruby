# Lalamove-ruby

This is an unofficial Ruby client for the [Lalamove](https://developers.lalamove.com/) API.

[![Maintainability](https://api.codeclimate.com/v1/badges/a67df9f7c59596d08870/maintainability)](https://codeclimate.com/github/petlove/lalamove-ruby/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/a67df9f7c59596d08870/test_coverage)](https://codeclimate.com/github/petlove/lalamove-ruby/test_coverage)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lalamove-ruby', github: 'petlove/lalamove-ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install lalamove-ruby

## Usage

### Configuration

You can generate an initializer using this single command

```ruby
    $ rails generate initializer lalamove
```
It will generate an simple Lalamove cliente configuraion. Howevere if you prefer, you can create manually, like this:

```ruby
    # config/initializer/lalamove.rb

    Lalamove.configure do |config|
      config.production = false # Your environment
      config.token = 'Your own Lalamove token'
      config.secret = 'Your own Lalamove secret key'
    end
```

[Country codes](https://developers.lalamove.com/?plaintext--sandbox#available-countries)


### Usage

##### Quotation

```ruby
Lalamove::Client.quotation.perform(stock_location: stock, orders: payload)
```
<details>

<summary>Payload example</summary>

```
{
  "stock_location":{
    "name":"São Paulo",
      "address1":"Av. Dr. Cardoso de Melo, 1 - Vila Olimpia, São Paulo - SP, 04548-004, Brazil",
      "address2":"",
      "loggi_shop_pk":null,
      "additional_shipping_time": null,
      "phone": "+551133350200"
  },
    [
    {
      "id":1,
      "number":"123456789",
      "cost":"8.9",
      "state":"en_route",
      "shipment_line_items":[
      {
        "quantity":1,
        "depth":7.0,
        "weight":0.013,
        "width":2.0,
        "height":10.0
      }
      ],
      "order_number":"123456",
      "email":"anderson.ferreira@petlove.com.br",
      "estimated_delivery_date":"2021-05-28",
      "updated_at":"2021-05-27T19:37:56Z",
      "created_at":"2021-05-27T19:34:21Z",
      "shop_name":"FOO BAR BAZ LTDA",
      "shop_full_address":null,
      "shipping_address":{
        "firstname":"Anderson",
        "lastname":"Ferreira",
        "address1":"Rua Dom salomão ferraz",
        "address2":"1",
        "zipcode":"05729140",
        "city":"São Paulo",
        "state_id":70,
        "state":"SP",
        "country":"BR",
        "phone":"11970009090",
        "house_number":"1",
        "neighborhood":"Vila Andrade",
        "reference":null
      }
    }
  ]
}
```
</details>


## Development

It is possible make your own quotation tests by adding your own keys in a `.env` file an example is available as `.env.sample`.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lalamove-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/lalamove-ruby/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lalamove::Ruby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lalamove-ruby/blob/master/CODE_OF_CONDUCT.md).
