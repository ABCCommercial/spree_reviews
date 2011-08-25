module SpreeReviews
  module ProductsControllerDecorator
    def self.included(target)
      target.class_eval do
        helper :reviews
      end
    end
  end
end
