class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_area
  belongs_to :shipping_charge
  belongs_to :shipping_day
  has_one_attached :image
  has_one :purchase


  validates :name, presence: true 
  validates :explanation, presence: true
  validates :category_id,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'must be half-width number' }
  validates :price,  presence: true ,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'must be between 300 and 9_999_999'  }
  validates :image, presence: true 

end
