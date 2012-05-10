class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user ||= User.new
    @user.roles.each { |role| send(role) }
  end
  
  def superman
    admin
    can :manage, :all
  end
  
  def owner
    admin
    can :manage, [User], :account_id => @user.account_id
  end
  
  def admin
    manager
    can :manage, [User], :account_id => @user.account_id
    cannot :destroy, [User]
  end
  
  def manager
    salesrep
  end
  
  def salesrep
    crew
  end
  
  def crew
    
  end
  
  def banned
    
  end
end
