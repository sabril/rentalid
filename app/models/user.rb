class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :invitable, :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :confirmed_at, :account, :roles, :status
  # attr_accessible :title, :body
  
  STATUSES = %w{Active InActive Banned}
  
  default_scope :include => [:account]
  
  # relationships
  #belongs_to :account
  acts_as_tenant(:account)
  
  scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }
  scope :without_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} = 0"} }
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end
  
  def is?(role)
    roles.include?(role.to_s)
  end
  
  STATUS_ACTIVE = 'Active'
  STATUS_INACTIVE  = 'InActive'
  STATUS_BANNED = 'Banned'
  
  scope :active, where(:status => STATUS_ACTIVE)
  scope :inactive, where(:status => STATUS_INACTIVE)
  scope :banned, where(:status => STATUS_BANNED)
  
  def status_tag
    case self.status
      when STATUS_ACTIVE then :bs_green
      when STATUS_INACTIVE then :bs_gray
      when STATUS_BANNED then :bs_red
    end
  end
  
end
