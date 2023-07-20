class Library < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :books

  validates :name, :address, presence: true
end
