class CreateFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :flags do |t|
      t.references :user, foreign_key: true
      t.text :content

      t.timestamps
    end
    add_reference :flags, :author, references: :user
  end
end
