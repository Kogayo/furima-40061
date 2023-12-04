class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one    :order
  belongs_to :user

  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :shipping_day

  has_one_attached :image


  validates :image,               presence: true
  validates :product_name,        presence: true
  validates :product_description, presence: true
  validates :category_id,         presence: true
  validates :condition_id,        presence: true
  validates :prefecture_id,       presence: true
  validates :shipping_day_id,     presence: true
  validates :shipping_cost_id,    presence: true
  validates :price,               presence: true, numericality: { greater_than: 299, less_than_or_equal_to: 9999999, only_integer: true }

with_options numericality: { other_than: 0 } do
  validates :category_id
  validates :prefecture_id
  validates :condition_id
  validates :shipping_cost_id
  validates :shipping_day_id
end

attribute :sold_out, default: false

def sold_out
  update(sold_out: true)
end

end