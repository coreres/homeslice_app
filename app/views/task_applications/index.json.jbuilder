json.array!(@task_applications) do |task_application|
  json.extract! task_application, :id, :user_id, :task_id, :status
  json.url task_application_url(task_application, format: :json)
end
