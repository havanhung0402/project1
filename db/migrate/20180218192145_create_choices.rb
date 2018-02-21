class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.string :text
      t.integer :question_id
      t.boolean :correct

      t.timestamps
    end
  end
end
