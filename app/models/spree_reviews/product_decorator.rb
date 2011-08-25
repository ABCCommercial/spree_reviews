module SpreeReviews
  # Add access to reviews/ratings to the product model
  module ProductDecorator
    def self.included(target)
      target.class_eval do
        has_many :reviews
      end
    end

    def get_stars
      [avg_rating.round, reviews_count]
    end

    def recalculate_rating
      reviews_count = self.reviews.reload.visible.count
      if reviews_count > 0
        self.update_attributes(:avg_rating => self.reviews.visible.sum(:rating).to_f / reviews_count, :reviews_count => reviews_count)
      else
        self.update_attribute :avg_rating, 0
      end
    end
  end
end
Product.send(:include, SpreeReviews::ProductDecorator)
