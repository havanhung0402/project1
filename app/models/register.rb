class Register < ApplicationRecord
  belongs_to :course
  validates :name, presence: true, length: {maximum: Settings.user_name_max_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email_max_length},
    format: {with: VALID_EMAIL_REGEX}
end
