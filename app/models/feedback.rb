class Feedback < ApplicationRecord
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  validate :recipient_cannot_be_author


  def recipient_cannot_be_author
    if recipient.id == author.id
      puts "RECIPIENT CANNOT BE AUTHOR!!!"
      errors.add(:host, "RECIPIENT CANNOT BE AUTHOR!!!")
    end
  end


end
