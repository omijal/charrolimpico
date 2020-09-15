# frozen_string_literal: true

require('test_helper')

class CareerTest < ActiveSupport::TestCase
  extend TestFields
  include TestFields

  def setup
    @organization = create_test_organization
    @object = Career.new(CAREER_TEST_DATA)
    @object.organization = @organization
  end

  _test_fields(long: 132)
  _test_nil_value(%i[organization])
end
