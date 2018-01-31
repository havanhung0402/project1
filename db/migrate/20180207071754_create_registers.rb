class CreateRegisters < ActiveRecord::Migration[5.1]
  def change
    create_table :registers do |t|
      t.string :name
      t.string :email
      t.date :birthday
      t.string :phone
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
