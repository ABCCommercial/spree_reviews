class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  has_many   :feedback_reviews

  validates_presence_of :name, :review
  validates_numericality_of :rating, :only_integer => true

  after_save :recalculate_rating
  after_destroy :recalculate_rating

  default_scope order("reviews.created_at DESC")
  scope :approved, lambda {|*args| {:conditions => ["(? = ?) or (approved = ?)", Spree::Reviews::Config[:include_unapproved_reviews], true, true ]}}
  scope :not_approved, where("approved = ?", false)

  scope :oldest_first, :order => "created_at asc"
  scope :preview,      :limit => Spree::Reviews::Config[:preview_size], :order=>"created_at desc"
  attr_protected :user_id, :product_id, :ip_address, :approved

  def feedback_stars
    return 0 if feedback_reviews.count <= 0
    ((feedback_reviews.sum(:rating)/feedback_reviews.count) + 0.5).floor
  end

  def recalculate_rating
    self.product.recalculate_rating
  end
end

