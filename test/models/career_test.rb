# frozen_string_literal: true

require('test_helper')

class CareerTest < ActiveSupport::TestCase
  extend TestFields
  def setup
    @organization = create_test_organization
    @object = Career.new(CAREER_TEST_DATA)
    @object.organization = @organization
  end

  test_fields(long: 132)
end
