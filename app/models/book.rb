class Book < ApplicationRecord
  belongs_to :library
  enum status: { 'available': 0, 'borrowed': 1 }

  validates :name, :author, :price, :status, presence: true
end
