module SpreeReviews
  class Ability
    include CanCan::Ability

    def initialize(user)
      can :create, Review do |review|
        user.has_role?(:user) || !Spree::Reviews::Config[:require_login]
      end
      can :create, FeedbackReview do |review|
        user.has_role?(:user) || !Spree::Reviews::Config[:require_login]
      end
    end
  end
end
