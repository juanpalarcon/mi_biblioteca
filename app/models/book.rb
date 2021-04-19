class Book < ApplicationRecord  
    validates :title, presence: true
    validates :author, presence: true
    validates :status, presence: true
    validates :given, presence: true
    validates :return, presence: true
    enum status: [:shelf, :borrowed]
end 