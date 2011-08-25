require 'spec_helper'

describe Product do
  describe ".recalculate_rating" do
    before(:each) do
      @product = valid_product!
    end

    it "should only use visible Reviews in the calculation" do
      review1 = valid_review!(@product, :rating => 1)
      review2 = valid_review!(@product, :rating => 3)
      review2.approved = true
      review2.save!

      @product.reviews.reload.visible.should == [ review2 ]

      @product.recalculate_rating

      @product.avg_rating.should == 3
      @product.reviews_count.should == 1
    end
  end
end
