class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name, :info, :image, presence: true
  validates :price, presence: true
  validates :price, numericality: { with: /\A[0-9]+\z/, message: "Price is not a number" }
  validates :price, numericality: { only_integer: true,greater_than: 299, less_than: 10_000_000} # 整数のみ、300以上9999999以下を指定

  # ActiveHashにより生成されたカラムのassociations及びvalidation

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shippingfee
  belongs_to :shipplace
  belongs_to :dateship

  # validates :category_id, :status_id, :shippingfee_id, :shipplace_id, :dateship_id, numericality: { other_than: 1 }

  with_options numericality: { other_than: 1} do
    validates :category_id
    validates :status_id
    validates :shippingfee_id
    validates :shipplace_id
    validates :dateship_id
  end
end
