class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :user, foreign_key: true
      t.integer :score
      t.integer :accepted

      t.timestamps
    end
    add_reference :matches, :match_user, references: :user

  end
end
