class Flag < ApplicationRecord
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  belongs_to :author, class_name: "User", foreign_key: "author_id"
end
