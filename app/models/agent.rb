class Agent < User
   has_many :task_assignments
   has_one  :agent_account
   has_many :assigned_tasks, class_name: "Task", foreign_key: "assigned_agent"
   has_many :task_applications



end
