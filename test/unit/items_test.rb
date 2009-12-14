require 'test_helper'

class ItemsTest < ActiveSupport::TestCase
  should "be valid" do
    assert Items.new.valid?
  end
end
