# Purpose
This gem is meant to be an easy mixin for consistent email address validation using Ruby's standard URI library. It can be used to take single email addresses, or even multiple email addresses separated by a comma.

## Installation

Add it to your Gemfile with:
```
gem 'email_valid8'
```
Next, install the gem using
```
bundle install
```

## Usage
#### In Application
In your model, you can include the following if you have a single attribute named `email` that needs to be checked. This will use ActiveModel::Validator to validate the field when your other validations are being run.
```
validates_with EmailAddressValidator, fields: %i[email]
```
Another feature of this gem is its ability to handle multiple emails in a comma-separated string. If you have an attribute that takes a longer string of emails named `whole_lotta_emails`, you can pass in the `multiples: true` attribute in order to validate all of those emails.

```
validates_with EmailAddressValidator, fields: %i[whole_lotta_emails], multiples: true
```

<!-- #### Command Line
TODO: explain how to use this in pry or IRB -->

## Maintenance
Steps to debug this gem, if there are any future issues:
* Add `s.add_dependency('pry', '~> 0')` to the gemspec
* Add `require 'pry'` to spec_helper.rb
* Run `gem build email_valid8.gemspec` in the terminal to rebuild
* Run `bundle install`


Check out [Faker Gem](https://github.com/stympy/faker) if you haven't! Made testing this gem a breeze.
