class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user ||= User.new
    @user.roles.each { |role| send(role) }
  end
  
  def owner
    admin
  end
  
  def admin
    manager
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
