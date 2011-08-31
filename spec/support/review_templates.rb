def valid_review(product, options={})
  r = Review.new(default_review_fields(options))
  r.approved = options[:approved] unless options[:approved].blank?
  r.product = product
  r
end

def valid_review!(product, options={})
  r = valid_review(product, options)
  r.save!
  r
end

def default_review_fields(options={})
  { :title  => "Test Review",
    :name   => "Test User",
    :review => "My review",
    :rating => 3
  }.merge(options)
end
