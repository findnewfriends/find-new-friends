class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :first_name
      t.string :last_name
      t.text :description
      t.date :birthdate
      t.string :gender
      t.references :job, foreign_key: true
      t.references :city, foreign_key: true
      t.string :role, null: false, default: "user"
      t.timestamps
    end
  end
end
