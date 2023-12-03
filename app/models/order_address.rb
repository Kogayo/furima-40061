class OrderAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id , :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token


  with_options presence: true do
  validates :user_id
  validates :item_id

  validates :phone_number,        format: { with: /\A\d{10}\z|\A\d{11}\z/ }
  validates :post_code,           format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :city
  validates :address

  validates :token
end


  def save
    # Order情報を作成し、代入
    order = Order.create(user_id: user_id, item_id: item_id)
          Address.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end

end