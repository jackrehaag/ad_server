class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'Administrator'
      can :manage, User
      can :manage, Advertiser
    end

    if user.role == 'User'
      can :manage, Advertiser
      cannot :destroy, Advertiser
    end
  end
end
