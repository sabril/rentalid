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
    can :manage, Account do |account|
      account.id == @user.account_id
    end
  end
  
  def admin
    manager
    can :manage, [User, Product], :account_id => @user.account_id
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
