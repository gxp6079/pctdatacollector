class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :task_progresses, dependent: :destroy
  has_many :tasks_in_progress, -> { TaskProgress.in_progress }, :through => :task_progresses, :source => :task
  has_many :tasks_finished, -> { TaskProgress.finished }, :through => :task_progresses, :source => :task

  validate :role_name

  def self.available_roles
    ['admin', 'subject']
  end

  def self.available_groups
    ['n/a', '.k', '.java']
  end

  def has_role?(role_name_symbol)
    role_name_symbol == role.underscore.to_sym
  end

  private
    def role_name
      if not User.available_roles().include?(role)
        errors.add :base, "Role #{role} does not exist in the system."
        return false
      end
    end
end
