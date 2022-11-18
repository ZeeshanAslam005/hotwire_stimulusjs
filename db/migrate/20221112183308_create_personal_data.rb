class CreatePersonalData < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_data do |t|
      t.string :first_name, null: false, limit: 25
      t.string :last_name, null: false, limit: 50
      t.string :nick_name
      t.string :email, null: false
      t.string :phone, null: false

      t.timestamps
    end
  end
end
