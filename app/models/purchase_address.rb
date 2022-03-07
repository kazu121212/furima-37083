class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_number, :shipping_area_id, :city, :house_number, :building, :telephone, :purchase_id, :item_id, :user_id, :token


  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :city
    validates :house_number
    validates :token
    
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
   

   
   
    validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :telephone, numericality: { with: /\A[0-9]+\z/, message: 'must be half-width number' }
    
  end
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'must be half-width number'}
    validates :telephone,  format: {with: /\A[0-9]{10,11}+\z/i,  message: "is too short"}
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(post_number: post_number, shipping_area_id: shipping_area_id, city: city, house_number: house_number, building: building, telephone: telephone ,purchase_id: purchase.id)
  end
end