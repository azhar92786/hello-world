# Example rake file structure
# Define a namespace for the task
namespace :manage_borrowers do
  # Give a description for the task
  desc 'Import Data from Excel'
  # Define the task
  task send_mail: :environment do 
    #@logs = Log.where('created_at >', Date.now-30.days )
    # Your task goes here     
    p 'sending email...' 
    p User.first
    #Book.last.update updated_at: DateTime.now 
    UserMailer.with(user: User.first, book: Book.first).welcome_email.deliver_now
  end
end