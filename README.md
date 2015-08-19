# Gif-ify: TIY Indy Ruby June 2015 cohort

This application handles gif display and uploads via an SPA interface.

As a bonus, it includes the Stripe Checkout quickstart example.

## Set up and running

* `bundle`
* `createdb gif2db`
* `rake db:migrate`
* `rake db:seed`
* `bundle exec figaro install`
* Add the needed keys to `config/application.yml` (amazon_access_key, amazon_secret_key, amazon_region, amazon_bucket, PUBLISHABLE_KEY, SECRET_KEY)
* `rails s`
* Enjoy!

## Testing

`RAILS_ENV=test rake db:schema:load; rake test`
