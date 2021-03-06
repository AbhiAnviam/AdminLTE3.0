class User < ApplicationRecord
  belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    role = Role.find_by(name:"User")
    self.role_id ||= role.id

  end  
end
