json.extract! comment, :id, :commenter, :body, :book_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
