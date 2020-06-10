class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.belongs_to :user, index: true
      t.belongs_to :matched_user, index: true
      t.float :score
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
