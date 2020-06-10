class CreateFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :flags do |t|
      t.belongs_to :author, index: true
      t.belongs_to :recipient, index: true
      t.text :content
      t.timestamps
    end
  end
end
