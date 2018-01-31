class Course < ApplicationRecord
	
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true, length: {maximum: Settings.title_course_max_length}
  validates :price, presence: true
  validates :image, presence: true
end
