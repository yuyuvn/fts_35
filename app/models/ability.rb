class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, :all
    elsif !user.is_guest?
      can :create, Exam
      can [:read, :update], Exam, user_id: user.id
    end
  end
end
