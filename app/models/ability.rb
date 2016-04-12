class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :subject
      can :home, StaticPage
      can [:take, :system_description], TaskActivity
    end
    
  end
end
