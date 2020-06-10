class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  belongs_to :city
    belongs_to :job

    has_many :feedbacks
    has_many :flags
    has_many :requests

    has_many :matches

    has_many :join_user_interests
    has_many :interests, through: :join_user_interests

end
