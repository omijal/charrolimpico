# frozen_string_literal: true

require('test_helper')

class CategoryTest < ActiveSupport::TestCase
  def setup
    @organization = Organization.new(ORG_TEST_DATA)
    @organization.save
    @category = Category.new(name: 'math')
    @category.organization = @organization
  end

  test 'category should be valid' do
    assert(@category.valid?)
  end

  test 'name should be present' do
    @category.name = ' '
    refute(@category.valid?)
  end

  test 'name should not be too long' do
    @category.name = 'x' * 33
    refute(@category.valid?)
  end

  test 'category must have an organization' do
    @category.organization = nil
    refute(@category.valid?)
  end

  test 'name should not be too short' do
    @category.name = 'xx'
    refute(@category.valid?)
  end
end
