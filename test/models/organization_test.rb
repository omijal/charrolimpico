# frozen_string_literal: true

require('test_helper')

class OrganizationTest < ActiveSupport::TestCase
  extend TestFields
  def setup
    @object = Organization.new(ORG_TEST_DATA)
  end

  _test_fields(long: 132)
end
