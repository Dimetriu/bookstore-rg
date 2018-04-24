class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
  end

  def current_ability
    @current_ability ||= AdminAbility.new(current_admin)
  end
end
