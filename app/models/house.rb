class House < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, message: 'Name must have 3 or more characters' }
  validates :bathroom, presence: true, allow_blank: true
  validates :bedroom, presence: true, allow_blank: true
  validates :address, presence: true, allow_blank: false
  validates :home_status, presence: true
  validates :home_type, presence: true
  validates :advertise, presence: true
  validates :price, presence: true,
            numericality: { greater_than: 0, message: 'Price must be greater than 0' }
  validates :desc, presence: true, allow_blank: true,
              length: { maximum: 1500, message: 'Description must have less than 1500 characters' }
  validates :square, presence: true
  validates :zone, presence: true
  validates :floor, presence: true, allow_blank: true
  validates :tv, presence: true, allow_blank: true
  validates :bacon, presence: true, allow_blank: true
  validates :ac, presence: true, allow_blank: true
  validates :images, presence: true
  
  belongs_to :user
  has_many_attached :images
end
