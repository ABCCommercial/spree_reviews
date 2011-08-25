require 'spec_helper'

describe Admin::ReviewsController do
  render_views

  before(:each) do
    @product = valid_product!(:permalink => 'nifty-product')
    @published = valid_review!(@product, :title => "My Great Review", :approved => true)
    @pending   = valid_review!(@product, :title => "Offtopic Review", :approved => false)

    @user = valid_user!
    sign_in @user
  end

  it "GET 'index' should list all Reviews" do
    get :index

    response.should be_success
    response.body.should =~ /My Great Review/
    response.body.should =~ /Offtopic Review/
  end

  it "GET 'index' should not list unapproved Reviews if reviews are always approved"

  it "POST 'approve' should approve a Review" do
    post :approve, :id => @pending.id

    @pending.reload
    @pending.approved.should == true

    Review.visible.should include(@pending)
  end
end
