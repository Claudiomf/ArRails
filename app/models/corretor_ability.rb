class CorretorAbility
  include CanCan::Ability
  def initialize(user)
    if user.role? :admin
      can :manage, :all
    end
    if user.role? :corretor
      can :read, :all
    end
  end
end