require File.dirname(__FILE__) + '/../spec_helper'

describe Review do
  before(:each) do
    @product = valid_product!
    @review  = valid_review(@product)
  end

  it "should be valid" do
    @review.should be_valid
  end
end
