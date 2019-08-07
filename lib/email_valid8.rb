require 'active_model'
require 'pry'

class EmailAddressValidator < ActiveModel::Validator
  def validate(record)
    return if record.blank?

    fields = options[:fields]
    multiples = options[:multiples]

    fields.each do |field|
      next if record.send(field).blank?

      attrs = record.send(field)
      if multiples
        attrs.split(',').each do |attr|
          attr.class == Array ? attr.each { |email| email_checker(email, field, record) } : email_checker(attr.strip, field, record)
        end
      else
        email_checker(attrs, field, record)
      end
    end
  end

  def email_checker(email, field, record)
    return if email =~ URI::MailTo::EMAIL_REGEXP && email !~ /[A-Z]/

    record.errors.add(field, 'is not written in a valid format')
  end

  def self.valid?(email)
    email =~ URI::MailTo::EMAIL_REGEXP && email !~ /[A-Z]/
  end
end
