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

def login!
  user = User.create(::TEST_USER_DATA)
  user.save
  post '/login', { params: { session: ::TEST_SESSION_DATA } }
  user
end
