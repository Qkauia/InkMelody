class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true

  has_one :cart
  has_many :orders
  has_many :products, -> { order(position: :asc) }
  # M by M
  has_many :like_products
  has_many :liked_products, through: :like_products, source: :product
  
  
  before_create :encrypt_password
  # after_save :method
  
  def self.login(data)
    email = data[:email]
    password = Digest::SHA256.hexdigest("xx#{data[:password]}yy")
    # find_by(email: email, password: password)
    find_by(email:, password: )#上面簡短寫法(冒號要留著)
  end
  
  def own?(p)
    product_ids.include?(p.id)
  end


  def liked?(p)
    liked_product_ids.include?(p.id)

  end

  private

  def encrypt_password
    salted_password = "xx#{self.password}yy"
    self.password = Digest::SHA256.hexdigest(salted_password)
  end
end
