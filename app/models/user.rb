class User < ApplicationRecord
  belongs_to :city
    belongs_to :job

    has_many :feedbacks
    has_many :flags
    has_many :requests

    has_many :matches

    has_many :join_user_interests
    has_many :interests, through: :join_user_interests

end
