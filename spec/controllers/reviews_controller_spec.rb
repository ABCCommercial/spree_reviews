require 'spec_helper'

describe ReviewsController do
  render_views

  before(:each) do
    @product = valid_product!(:permalink => 'nifty-product')
  end

  it "GET 'index' should list only the approved reviews" do
    @published = valid_review!(@product, :title => "My Great Review", :approved => true)
    @pending   = valid_review!(@product, :title => "Offtopic Review", :approved => false)

    get :index, :product_id => @product.permalink

    response.should be_success
    response.body.should =~ /My Great Review/
    response.body.should_not =~ /Offtopic Review/
  end

  context "authenticated User" do
    before(:each) do
      @user = valid_user!
      sign_in @user
    end

    it "POST 'create' should create a review" do
      post :create, :product_id => @product.permalink, :review => { :rating => '5', :title => "My Review", :review => 'Test Content', :name => 'Test User' }

      Review.count.should == 1
      Review.visible.count.should == 0

      @product.reload
      @product.reviews.count.should == 1
      @product.reviews.approved.count.should == 0
      @product.avg_rating.should == 0

      review = @product.reviews.first
      review.user.should == @user
    end
  end
end
