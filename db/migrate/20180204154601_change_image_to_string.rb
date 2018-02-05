class ChangeImageToString < ActiveRecord::Migration[5.1]
  def change
  	change_column :courses, :image, :string
  end
end
