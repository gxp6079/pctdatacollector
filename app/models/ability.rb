class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :subject
      can [:home, :download_tasks], StaticPage
      can :update, TaskProgress
      can :create, PermanenceTime
      can [:take, :system_description, :finish, :upload_tasks], TaskActivity
      can [:retake], TaskActivity do |t|
        t.can_retake_experiment? user
      end
    end
    
  end
end
