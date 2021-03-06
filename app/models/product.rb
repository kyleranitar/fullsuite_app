class Product < ApplicationRecord

  validates :name, presence: true
  validates :sku, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true
  validates :cost_of_goods, presence: true
end
