require 'rubygems'
require 'rspec'
require 'active_model'
require 'faker'
require 'pry'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'email_valid8'

class TestEmailModel
  include ActiveModel::Model
  attr_accessor :email_by_any_other_name

  def initialize(email_by_any_other_name)
    @email_by_any_other_name = email_by_any_other_name
  end

  def []=(attribute, value)
    public_send("#{attribute}=", value)
  end

  validates_with EmailAddressValidator, fields: %i[email_by_any_other_name]
end

class TestMultipleEmailsModel
  include ActiveModel::Model
  attr_accessor :email

  def initialize(email)
    @email = email
  end

  def []=(attribute, value)
    public_send("#{attribute}=", value)
  end

  validates_with EmailAddressValidator, fields: %i[email], multiples: true
end
