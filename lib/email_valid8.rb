require 'active_model'

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
    return if validation_check(email)

    record.errors.add(field, 'is not written in a valid format')
  end

  def validation_check(email)
    email =~ URI::MailTo::EMAIL_REGEXP && email !~ /[A-Z]/
  end

  def self.valid?(email)
    validation_check(email)
  end

  def self.invalid?(email)
    !validation_check(email)
  end
end
