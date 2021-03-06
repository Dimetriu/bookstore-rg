class AdminAbility
  include CanCan::Ability

  def initialize(admin)
    can :access, :rails_admin
    can :manage, :all
  end
end