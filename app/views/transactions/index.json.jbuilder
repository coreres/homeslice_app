json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :task_id, :amount, :trans_date, :trans_time
  json.url transaction_url(transaction, format: :json)
end
