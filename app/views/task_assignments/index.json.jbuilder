json.array!(@task_assignments) do |task_assignment|
  json.extract! task_assignment, :id, :agent_id, :task_id
  json.url task_assignment_url(task_assignment, format: :json)
end
