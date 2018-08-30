class Book < ApplicationRecord
    # extend FriendlyId
    # friendly_id: :title, use: :slugged
    validates :image, presence: true
    validates :title, presence: true
    validates_uniqueness_of :title
    has_many :comments, dependent: :delete_all
    has_many :logs, dependent: :delete_all
    has_and_belongs_to_many :categories
    mount_uploader :image, ImageUploader

    # default_scope { order(id: :desc) } 
    
    #constants...
    LIMIT = 100  

    after_update :create_log, if: :saved_change_to_borrower?

    def create_log
        if borrower.nil?
            Log.create(user_id: User.current.id, description: "Returned" , book_id: id)
        else
            Log.create(user_id: User.current.id, description: "Borrowed" , book_id: id)
        end
    end

 end
