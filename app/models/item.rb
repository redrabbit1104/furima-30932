class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

   validates :name, :info, :image, :price,presence: true
end