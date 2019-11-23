class Item < ApplicationRecord
  belongs_to :category1
  has_one_attached :image
end
