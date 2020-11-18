class User < ApplicationRecord
  acts_as_token_authenticatable

  enum role: { student: 0, tutor: 1, admin: 2 }
  has_one :student, dependent: :destroy
  has_one :tutor, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
