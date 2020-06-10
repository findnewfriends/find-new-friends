class Match < ApplicationRecord
    enum accepted: [:accepted, :refused, :pending]
    belongs_to :user, class_name: "User", foreign_key: "user_id"
    belongs_to :matched_user, class_name: "User", foreign_key: "matched_user_id"
end
