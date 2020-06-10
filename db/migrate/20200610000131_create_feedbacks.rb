class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.references :user, foreign_key: true
      t.integer :score
      t.text :content
      t.boolean :recommended

      t.timestamps
    end
    add_reference :feedbacks, :author, references: :user
  end
end
