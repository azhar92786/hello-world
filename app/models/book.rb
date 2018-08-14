class Book < ApplicationRecord
    has_many :comments
    has_many :categories, dependent: :nullify

    has_many :book_categories
    mount_uploader :image, ImageUploader
    validates :image, presence: true

    # filters on 'country_id' foreign key
    scope :with_title, lambda { |titles|
    where(title: [*titles])
    }

    ActiveAdmin.register Book do
        filter :title
    end
   #jfdnewqkjfnre
end
