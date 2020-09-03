# frozen_string_literal: true

if ENV['RAILS_ENV'] == 'test'
  require('simplecov')

  SimpleCov.start('rails')
end

ENV['RAILS_ENV'] ||= 'test'
require_relative('../config/environment')
require('rails/test_help')

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    if ENV['RAILS_ENV'] == 'test'
      parallelize_setup do |worker|
        SimpleCov.command_name("#{SimpleCov.command_name}-#{worker}")
      end

      parallelize_teardown do |_worker|
        SimpleCov.result
      end
    end

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

ENV['RAILS_ENV'] ||= 'test'
require_relative('../config/environment')
require('rails/test_help')

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

TEST_USER_DATA = {
  username: 'tacho', email: 'tachoguitar@gmail.com', password: 'secret'
}.freeze

TEST_SESSION_DATA = {
  username: 'tachoguitar@gmail.com',
  password: 'secret'
}.freeze

ORG_TEST_DATA = {
  fullname: 'omijal', shortname: 'omijal'
}.freeze

CAREER_TEST_DATA = {
  fullname: 'olimpiada primaria', shortname: 'omijalp'
}.freeze

def create_test_organization
  organization = Organization.new(ORG_TEST_DATA)
  organization.save
  organization
end

def login!
  user = User.create(::TEST_USER_DATA)
  user.save
  post('/login', params: { session: ::TEST_SESSION_DATA })
  user
end

module TestFields
  def test_fields(fields: %i[shortname fullname], short: 1, long: 120)
    fields.each do |field|
      test "#{field} should be present" do
        @object.send("#{field}=".to_sym, ' ')
        refute(@object.valid?)
      end

      test "#{field} should not be too long" do
        @object.send("#{field}=".to_sym, 'x' * long)
        refute(@object.valid?)
      end

      test "#{field} should not be too short" do
        @object.send("#{field}=".to_sym, 'x' * short)
        refute(@object.valid?)
      end
    end
  end
end
