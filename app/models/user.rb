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


  after_create :welcome_send
  def welcome_send
    puts "Welcome email is going to be requested next"
    UserMailer.welcome_email(self).deliver_now
  end

  def admin?
    self.role == "admin"
  end

end
