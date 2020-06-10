class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :description
      t.date :birthdate
      t.references :job, foreign_key: true
      t.references :city, foreign_key: true
      t.string :gender

      t.timestamps
    end
  end
end
