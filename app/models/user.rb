class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :task_progresses, dependent: :destroy
  has_many :in_progress_tasks, -> { TaskProgress.in_progress }, :through => :task_progresses, :source => :task
  has_many :finished_tasks, -> { TaskProgress.finished }, :through => :task_progresses, :source => :task

  validate :role_name

  def unfinished_systems
    SystemExample.all.select{ |system_example| !has_finished_system?(system_example) }
  end

  def in_progress_systems
    unfinished_systems.select{ |system_example| (system_example.tasks & (finished_tasks | in_progress_tasks)).size > 0 }
  end

  def has_finished_system? system_example
    system_example.tasks.inject(true){ |result, task| result && has_finished_task?(task) }
  end

  def unfinished_tasks system_example
    system_example.tasks.select{ |task| !has_finished_task?(task) }
  end

  def has_finished_task? task
    finished_tasks.include? task
  end

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
