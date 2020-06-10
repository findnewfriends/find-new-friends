class Flag < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: "User"

end
