require 'spec_helper'

RSpec.describe EmailAddressValidator, type: :validator do
  describe 'multiples: false' do
    subject { TestEmailModel.new(email) }

    context 'when the email is nil' do
      let(:email) { nil }
      it { is_expected.to be_valid }
    end

    context 'when the email is blank' do
      let(:email) { '' }
      it { is_expected.to be_valid }
    end

    context 'when the email is present' do
      context 'standard format' do
        let(:email) { Faker::Internet.email }
        it { is_expected.to be_valid }
      end

      it 'must be in the proper email format' do
        invalid_items = ['another@example@com',
                         'test@example.com,,',
                         'bar.foo@yahoo.com,',
                         '.....@a....',
                         'oh.boyyyd@SOME+THING-ODD!!.com',
                         'a.b@example,com',
                         'a.b@example,co.de',
                         'foo bar',
                         'foo@@bar.com',
                         'foo@example.com, bar@example.com',
                         'foob@example.com, barf@example.com, xanz@example.com',
                         'fooBar@example.com']

        invalid_items.each do |item|
          model = TestEmailModel.new(item)
          expect(model).to be_invalid
          expect(model.errors.details.first[0]).to eq :email_by_any_other_name
          expect(model.errors.full_messages.to_s).to include 'Email by any other name is not written in a valid format'
        end
      end
    end
  end

  describe 'multiples: true' do
    subject { TestMultipleEmailsModel.new(email) }

    context 'string of comma-separated emails format' do
      it 'validates to true' do
        valid_items = ['foo@example.com, bar@example.com',
                       'foob@example.com, barf@example.com, xanz@example.com',
                       'doot@example.com', 'poot@example.com']
        valid_items.each do |item|
          model = TestMultipleEmailsModel.new(item)
          expect(model).to be_valid
        end
      end
    end

    context 'when the email is nil' do
      let(:email) { nil }
      it { is_expected.to be_valid }
    end

    context 'when the email is blank' do
      let(:email) { '' }
      it { is_expected.to be_valid }
    end

    context 'when the email is present' do
      context 'standard format' do
        let(:email) { Faker::Internet.email }
        it { is_expected.to be_valid }
      end

      it 'can not be valid' do
        invalid_items = ['user@example.com, another@example@com',
                         'bar,foo@yahoo.com.',
                         '.....@a....',
                         'oh.boyyyd@SOME+THING-ODD!!.com',
                         'a.b@example,com',
                         'a.b@example,co.de',
                         'foo bar',
                         'foo@@bar.com']

        invalid_items.each do |item|
          model = TestMultipleEmailsModel.new(item)
          expect(model).to be_invalid
          expect(model.errors.full_messages.to_s).to include 'Email is not written in a valid format'
        end
      end
    end
  end
end
