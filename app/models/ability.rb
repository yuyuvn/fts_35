class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_admin?
      can :manage, :all
    end

    if !user.is_guest?
      can :create, :exam
      can [:read, :update], :exam, user_id: user.id
    end
  end
end
