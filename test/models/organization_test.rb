# frozen_string_literal: true

require('test_helper')

class OrganizationTest < ActiveSupport::TestCase
  def setup
    @organization = Organization.new(ORG_TEST_DATA)
  end

  test 'organization should be valid' do
    assert(@organization.valid?)
  end

  %i[shortname fullname].each do |field|
    test "#{field} should be present" do
      @organization.send("#{field}=".to_sym, ' ')
      refute(@organization.valid?)
    end

    test "#{field} should not be too long" do
      @organization.send("#{field}=".to_sym, 'x' * 120)
      refute(@organization.valid?)
    end

    test "#{field} should not be too short" do
      @organization.send("#{field}=".to_sym, 'x')
      refute(@organization.valid?)
    end
  end
end
