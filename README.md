[![Gem Version](https://badge.fury.io/rb/email_valid8.svg)](https://badge.fury.io/rb/email_valid8)
[![Codeship Status for ohboyd/email_valid8](https://app.codeship.com/projects/c25d4b70-8a67-0137-305f-360e0f58cb63/status?branch=master)](https://app.codeship.com/projects/354806)

# Email Valid8

## Replace the Random Regex you Copied from Stack Overflow!
This gem is meant to be an easy mixin for consistent email address validation using Ruby's standard URI library. It can be used to take single email addresses, or even multiple email addresses separated by a comma.

## Installation

Add it to your Gemfile using:
```
gem 'email_valid8'
```
Next, install the gem by running:
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

#### From the Command Line
It's also possible to use this tool in your console, irb, or a pry session. Just make sure that the gem is installed by running the following command in terminal:
```
$ gem install email_valid8
``` 
And you should see: 
```
Fetching: email_valid8-0.0.6.gem (100%)
Successfully installed email_valid8-0.0.6
Parsing documentation for email_valid8-0.0.6
Installing ri documentation for email_valid8-0.0.6
Done installing documentation for email_valid8 after 0 seconds
1 gem installed
```
Then, open your console by running `rails c`, `irb`, or `pry` in the terminal. Once you have your terminal prompt, require the gem and you can test the validity of your email address by running the commands below:
```
irb(main):001:0> require 'email_valid8'
=> true
irb(main):002:0> EmailAddressValidator.valid?('admin@example.com')
=> true
irb(main):003:0> EmailAddressValidator.valid?('admin@@example.com')
=> false
```


Check out [Faker Gem](https://github.com/stympy/faker) if you haven't! Made testing this gem a breeze.
