module BooksHelper
    def user_borrowed_book?(book)
        book.borrower == current_user.email
    end

    def can_enquire_with_borrower?(book)
        (book.borrower != current_user.email) && (book.borrower != nil)
    end
end
