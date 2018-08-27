class ManageBorrowersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    p '------------------------------------------------------------'
    p 'performed Job: Manage borrowers...'
    p '------------------------------------------------------------'
     UserMailer.with(User.first, book: Book.last).welcome_email.deliver_later
     ManageBorrowersJob.perform_later 
  end
end
