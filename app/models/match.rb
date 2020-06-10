class Match < ApplicationRecord
    enum accepted: [:accepted, :refused, :pending]
    belongs_to :user, class_name: "User", foreign_key: "user_id"
    belongs_to :matched_user, class_name: "User", foreign_key: "matched_user_id"

    validate :user_cannot_be_repeated


    def user_cannot_be_repeated
      if user.id == matched_user.id
        puts "User cannot be Matched_user!!!"
        errors.add(:host, "User cannot be Matched_user!!!")
      end
    end


end
