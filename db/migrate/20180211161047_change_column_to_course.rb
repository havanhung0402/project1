class ChangeColumnToCourse < ActiveRecord::Migration[5.1]
  def change
    change_table :courses do |t|
      t.change :image, :string
    end
  end
end
