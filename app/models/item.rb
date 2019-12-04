class Item < ApplicationRecord
  validates :price, presence: true
  validates :name, presence: true,uniqueness: true, length: { minimum: 3 } ,:case_sensitive => false

  belongs_to :category1
  has_one_attached :image
  # belongs_to :bcart
  has_many :bcart
  has_many :users,through: :bcart
end
