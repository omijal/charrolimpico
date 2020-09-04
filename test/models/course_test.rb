# frozen_string_literal: true

require('test_helper')

class CourseTest < ActiveSupport::TestCase
  include TestFields
  extend TestFields
  def setup
    @object = Course.new(COURSE_TEST_DATA)
    @object.organization = create_test_organization
  end

  _test_fields(long: 255)
  _test_nil_value(%i[organization])
end
