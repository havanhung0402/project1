class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.text :title
      t.text :content
      t.binary :image
      t.integer :price

      t.timestamps
    end
  end
end
