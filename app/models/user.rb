class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true

  before_create :encrypt_password
  # after_save :method
  
  def self.login(data)
    email = data[:email]
    password = Digest::SHA256.hexdigest("xx#{data[:password]}yy")
    # find_by(email: email, password: password)
    find_by(email:, password: )#上面簡短寫法(冒號要留著)
  end

  private

  def encrypt_password
    salted_password = "xx#{self.password}yy"
    self.password = Digest::SHA256.hexdigest(salted_password)
  end
end