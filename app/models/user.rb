class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :role_name

  def self.available_roles
    ['admin', 'subject']
  end

  private
    def role_name
      if not User.available_roles().include?(role)
        errors.add :base, "Role #{role} does not exist in the system."
        return false
      end
    end
end
