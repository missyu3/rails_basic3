class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_validation { email.downcase! }
  has_secure_password

  with_options presence: true do
    validates :name
    validates :email
  end
  validates :name, length: {maximum: 35}
  validates :email, uniqueness: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }  , on: :create
end
