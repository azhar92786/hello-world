json.extract! log, :id, :user_id, :description, :book_id, :created_at, :updated_at
json.url log_url(log, format: :json)
