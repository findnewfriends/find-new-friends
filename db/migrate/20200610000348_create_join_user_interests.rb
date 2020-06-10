class CreateJoinUserInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :join_user_interests do |t|
      t.references :user, foreign_key: true
      t.references :interest, foreign_key: true
      t.integer :intensity
      t.timestamps
    end
  end
end
