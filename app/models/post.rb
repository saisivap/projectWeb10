class Post < ApplicationRecord


  belongs_to :user

  has_one_attached :image
  # validates :image, presence: true
  # validate :correct_document_mime_type
  # private
  #
  # def correct_document_mime_type
  #   if image.attached?
  #     errors.add(:image, 'Must be an image')
  #   end
  # end

end
