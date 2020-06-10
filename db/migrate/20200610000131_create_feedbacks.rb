class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.belongs_to :author, index: true
      t.belongs_to :recipient, index: true
      t.text :content
      t.boolean :recommended
      t.timestamps
    end
  end
end
