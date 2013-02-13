class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  has_many   :feedback_reviews

  validates_presence_of :name, :review
  validates_numericality_of :rating, :only_integer => true
  validates :product, :presence => true

  after_save :recalculate_rating
  after_destroy :recalculate_rating

  default_scope order("reviews.created_at DESC")
  scope :approved,     where("approved = ?", true)
  scope :not_approved, where("approved = ?", false)

  scope :visible, lambda {|*args| {:conditions => ["(? = ?) or (approved = ?)", Spree::Reviews::Config[:include_unapproved_reviews], true, true ]}}

  scope :oldest_first, :order => "created_at asc"
  scope :preview,      :limit => Spree::Reviews::Config[:preview_size], :order=>"created_at desc"
  #  CVE-2013-0276 is a vulnerability where a request can be crafted to surpass the protection; to deal with this, as upgrade to fix version is not possible; suggested workaround of replacing attr_protected with attr_accessible is being used
  attr_accessible :rating, :review, :name

  def feedback_stars
    return 0 if feedback_reviews.count <= 0
    ((feedback_reviews.sum(:rating)/feedback_reviews.count) + 0.5).floor
  end

  def recalculate_rating
    self.product.recalculate_rating
  end
end

