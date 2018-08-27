class UserMailer < ApplicationMailer
    default from: 'azharnahoor@sc-mauritius.com'
 
    def welcome_email
      @user = params[:user]
      @book = params[:book]
      @url  = 'http://localhost:3000/books/18'
      mail(to: @user.email, subject: 'You have borrowed ' + @book.title)
    end

    def enquiry_email
      @querier = params[:querier]
      @borrower = params[:borrower]
      @book = params[:book]
      @url  = 'http://localhost:3000/books/18'
      mail(to: @borrower, subject: 'Book enquiry ' + @book.title)
    end


end
