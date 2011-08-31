require File.dirname(__FILE__) + '/../spec_helper'

describe Review do
  before(:each) do
    @product = valid_product!
    @review  = valid_review(@product)
  end

  it "should be valid" do
    @review.should be_valid
  end

  it "should not be valid without a Product" do
    review = Review.new(default_review_fields)
    review.product.should be_nil
    review.product_id.should be_nil

    review.valid?.should be_false
  end

  it "should not be valid with a bogus product_id" do
    review = Review.new(default_review_fields(:product_id => 0))

    review.valid?.should be_false
  end
end
