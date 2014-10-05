class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'Administrator'
      can :manage, User
      can :manage, Advertiser
      can :manage, Campaign
    end

    if user.role == 'User'
      can :manage, Advertiser
      cannot :destroy, Advertiser
      can :read, Campaign
      can :create, Campaign
    end
  end
end
