class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { in: 3..250, message: 'Name must be a string of at least 3 characters' }
  validates :username, presence: true, length: { in: 3..250, message: 'Name must be a string of at least 3 characters or it have been taken' }, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :company_name, presence: true, length: { in: 3..250, message: 'Comapany Name must be  least 3 characters' }
  validates :address, presence: true
  validates :details, presence: true, allow_blank: true,
                length: { maximum: 1500, message: 'Description must have less than 1500 characters' }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  validates :avatar, presence: true

  has_many :houses
  has_many :phones
  has_one_attached :avatar
end
