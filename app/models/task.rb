class Task < ActiveRecord::Base
  belongs_to :user
  has_one :transaction
  has_one :task_assignment
  # has_one :task_assignment
  enum status: { active: 0, in_progress: 1, completed: 2, cancelled: 0 }

end
