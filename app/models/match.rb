class Match < ApplicationRecord
    enum accepted: [:accepted, :refused, :pending]
    belongs_to :user, class_name: "User"
    belongs_to :match_user, class_name: "User"
end
