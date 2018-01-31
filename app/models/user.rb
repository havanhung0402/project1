class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :courses
  paginates_per 10
  before_save {self.email = email.downcase}
  validates :name,  presence: true, length: {maximum: Settings.user_name_max_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email_max_length},
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}
  validates :address, presence: true, length: {maximum: Settings.address_max_length}

  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.password_min_length},
             allow_nil: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
