class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name, :info, :image, :price,presence: true

  #ActiveHashにより生成されたカラムのassociations及びvalidation

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shippingfee
  belongs_to :shipplace
  belongs_to :dateship

  validates :category_id, :status_id, :shippingfee_id, :shipplace_id, :dateship_id, numericality: { other_than: 1 }
end