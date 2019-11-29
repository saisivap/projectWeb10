class Item < ApplicationRecord
  belongs_to :category1
  has_one_attached :image
  # belongs_to :bcart
  has_many :bcart
  has_many :users,through: :bcart
end
