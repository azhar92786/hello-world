json.extract! book, :id, :title, :description, :image, :borrower, :created_at, :updated_at
json.url book_url(book, format: :json)
