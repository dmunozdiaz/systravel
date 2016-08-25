class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :assignments
  has_many :roles, :through => :assignments

 
  

  def is_admin?
     self.has_role? :admin
  end

  private 

  def has_role?(role_sym)
	  roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end
       
end
