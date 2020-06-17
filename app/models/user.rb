class User < ApplicationRecord

  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :trackable
  belongs_to :city, optional: true
  belongs_to :job , optional: true

  has_many :feedbacks
  has_many :flags
  has_many :requests

  has_many :matches

  has_many :join_user_interests
  has_many :interests, through: :join_user_interests


  # after_create :welcome_send
  def welcome_send
    # puts "Welcome email is going to be requested next"
    UserMailer.welcome_email(self).deliver_now
  end


  # after_create :create_matches_for_new_user
  # def create_matches_for_user
  #   User.all.each_with_index do |existing_user,index|
  #     u = Match.new
  #     u.user = self
  #     u.matched_user = existing_user
  #     u.score = MatchingScore.new.perform(self,existing_user)
  #     u.save if self != existing_user
  #   end
  # end



  def admin?
    self.role == "admin" unless self.nil?
  end

end
