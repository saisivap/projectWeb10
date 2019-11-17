class Quotation < ApplicationRecord
  validates :author_name,presence: true,length: {minimum: 3,maximum: 50}
  validates :quote , presence: true,length: {minimum: 10,maximum: 300}


  def self.search(search)
    if search
      where(["quote LIKE ?","%#{search}%"])
    else
      all
    end
  end

end
