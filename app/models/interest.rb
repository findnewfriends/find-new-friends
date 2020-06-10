class Interest < ApplicationRecord
    has_many :join_user_interests
    has_many :users, through: :join_user_interests
end
