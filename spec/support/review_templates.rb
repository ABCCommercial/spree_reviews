def valid_review(product, options={})
  defaults = { :title   => "Test Review",
               :name    => "Test User",
               :review => "My review about #{product.name}",
               :rating  => 3
             }
  r = Review.new(defaults.merge(options))
  r.approved = options[:approved] unless options[:approved].blank?
  r.product = product
  r
end

def valid_review!(product, options={})
  r = valid_review(product, options)
  r.save!
  r
end
