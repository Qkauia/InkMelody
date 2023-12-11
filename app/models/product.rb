class Product < ApplicationRecord
  acts_as_list scope: :user
  validates :title, presence: true 
  # ruby語法省略小括號跟大括號 validates(:title, {presence: true})
  # validates_presence_of : title
  validates :price, numericality: { greater_than: 0 }


  belongs_to :user
  has_many :comments, -> {order(id: :desc)}
  has_one_attached :cover

  has_one_attached :cover do |f|
    f.variant :cover, resize_to_limit: [1000, 1000]
    f.variant :thumb, resize_to_limit: [400, 400]
  end
  # M by M
  has_many :liked_products
  has_many :liked_users, through: :liked_products, source: :user
  #scope
  # scope :ok , ->{where(deleted_at: nil)} 
  default_scope { where(deleted_at: nil)}
  default_scope { where(onsale: true) }

  def self.ransackable_attributes(auth_object = nil)
    ["description", "onsale", "price", "title"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
  
  def destroy
    update(deleted_at: Time.current)
  end
end
