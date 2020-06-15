class JoinUserInterest < ApplicationRecord
  belongs_to :user
  belongs_to :interest


  validate :interest_for_user_cannot_be_repeated


  def interest_for_user_cannot_be_repeated
    if JoinUserInterest.where(user:user).collect(&:interest).include? interest
      puts "User cannot cannot have the same interest twice!!!"
      errors.add(:base, "User cannot cannot have the same interest twice!!!")
    end
  end



end
