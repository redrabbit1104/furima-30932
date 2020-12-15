class Address < ApplicationRecord
  belongs_to :order

  # ActiveHashにより生成されたカラムのassociations及びvalidation

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipplace
end
