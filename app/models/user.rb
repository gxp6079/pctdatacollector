class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :task_progresses, dependent: :destroy
  has_many :permanence_times, dependent: :destroy
  has_many :pre_test_answers, dependent: :destroy
  has_many :in_progress_tasks, -> { TaskProgress.in_progress }, :through => :task_progresses, :source => :task
  has_many :finished_tasks, -> { TaskProgress.finished }, :through => :task_progresses, :source => :task

  validate :role_name

  def all_systems
    # we considered a system only if in the database the system has tasks and file examples
    # for the group of the current user, and the system and user are for training purposes

    SystemExample.joins(:tasks)
                 .joins(:file_examples)
                 .where('system_examples.is_for_training = ?', is_in_training)
                 .where('system_examples.disabled = ?', false)
                 .where('file_examples.name LIKE ?', '%' + group + '%')
                 .distinct
  end

  def finished_experiment
    in_progress_systems.size <= 0 && unfinished_systems.size <= 0
  end

  def unfinished_systems
    all_systems.select{ |system_example| !has_finished_system?(system_example) }
  end

  def finished_systems
    all_systems.select{ |system_example| has_finished_system?(system_example) }
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

  def active_for_authentication?
    super && self.is_active?
  end

  def inactive_message
    "Sorry, this account is not active."
  end

  def stored_file_ids_has_exactly_the_same_elements_of? current_file_ids
    stored_file_ids_order = stored_task_file_ids_order
    (stored_file_ids_order - current_file_ids).empty? && (stored_file_ids_order.size == current_file_ids.size)
  end

  def stored_task_file_ids_order
    eval(task_file_ids_order)
  end

  private
    def role_name
      if not User.available_roles().include?(role)
        errors.add :base, "Role #{role} does not exist in the system."
        return false
      end
    end
end
