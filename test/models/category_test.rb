# frozen_string_literal: true

require('test_helper')

class CategoryTest < ActiveSupport::TestCase
  extend TestFields
  include TestFields
  def setup
    @object = Category.new(name: 'math')
    @organization = create_test_organization
    @object.organization = @organization
  end

  _test_fields(fields: %i[name])
  _test_nil_value(%i[organization])
end
