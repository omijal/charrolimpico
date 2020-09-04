# frozen_string_literal: true

require('test_helper')

class JudgeTest < ActiveSupport::TestCase
  include TestFields
  extend TestFields

  def setup
    @object = Judge.new(JUDGE_TEST_DATA)
  end

  _test_fields(long: 400)

  test 'bad url' do
    @object.url = 'hello'
    refute @object.valid?
  end
end
