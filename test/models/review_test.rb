require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
      @user = users(:example)
      # This code is not idiomatically correct.
      @micropost = Micropost.new(content: "Lorem ipsum", user_id: @user.id)
    end

    test "should be valid" do
      assert @micropost.valid?
    end

    test "user id should be present" do
      @micropost.user_id = nil
      assert_not @micropost.valid?
    end
end
