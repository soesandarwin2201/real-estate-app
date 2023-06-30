class Phone < ApplicationRecord
  belongs_to :users
  validates :address, presence: true
end
