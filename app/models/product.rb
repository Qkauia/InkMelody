class Product < ApplicationRecord
  validates :title, presence: true 
  # ruby語法省略小括號跟大括號 validates(:title, {presence: true})
  # validates_presence_of : title
  validates :price, numericality: { greater_than: 0 }
end
