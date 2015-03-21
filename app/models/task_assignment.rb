class TaskAssignment < ActiveRecord::Base
  belongs_to :agent
  belongs_to :task
end
