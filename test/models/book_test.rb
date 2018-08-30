require 'test_helper'

class BookTest < ActiveSupport::TestCase
   test "should not save Book without title" do
        book = Book.new 
        # book[:title] 
        assert_not book.save, "Saved the book without a title"
    end

    test "should not save Book without image" do
        book = Book.new
       # book.image = "abcdefghudjoked"
        assert_not book.save, "Saved the book without an image"
    end

    test "should save book" do
        book = books(:one)
        assert book.save
    end

   
    test "should report error" do
        # some_undefined_variable is not defined elsewhere in the test case
        assert_raises(NameError) do
        some_undefined_variable
        end
    end
    
end
