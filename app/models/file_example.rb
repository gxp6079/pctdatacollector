class FileExample < ActiveRecord::Base
  belongs_to :system_example
  has_many :permanence_times, dependent: :restrict_with_exception

  validates_presence_of :system_example_id
  validates_presence_of :name

  scope :all_by_user_group, -> (user) { where('name LIKE ?', '%' + user.group + '%') }

  def self.known_file_extensions
    ['.k', '.java']
  end

  def file_extension
    File.extname(name)
  end
end
