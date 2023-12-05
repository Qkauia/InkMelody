class Product < ApplicationRecord
  validates :title, presence: true 
  # ruby語法省略小括號跟大括號 validates(:title, {presence: true})
  # validates_presence_of : title
  validates :price, numericality: { greater_than: 0 }

  belongs_to :user
  has_many :comments, -> {order(id: :desc)}
  # M by M
  has_many :liked_products
  has_many :liked_users, through: :liked_products, source: :user
  #scope
  # scope :ok , ->{where(deleted_at: nil)} 
  default_scope { where(deleted_at: nil)}

  def destroy
    update(deleted_at: Time.current)
  end
end
