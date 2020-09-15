# frozen_string_literal: true

require('test_helper')

class ProblemTest < ActiveSupport::TestCase
  include TestFields
  extend TestFields

  def setup
    @organization = create_test_organization
    @judge = create_test_judge
    @object = Problem.new(PROBLEM_TEST_DATA)
    @object.judge = @judge
    @object.organization = @organization
  end

  _test_fields(long: 255)
  _test_nil_value(%i[organization judge])

  test 'bad url' do
    @object.url = 'hello'
    refute(@object.valid?)
  end
end
