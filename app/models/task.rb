class Task < ActiveRecord::Base
  belongs_to :user
  enum status: { active: 0, in_progress: 1, completed: 2, cancelled: 0 }

end
