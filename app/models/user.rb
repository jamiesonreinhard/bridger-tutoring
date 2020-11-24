class User < ApplicationRecord
  has_secure_password

  enum role: [:student, :tutor, :admin]
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  PASSWORD_REQUIREMENTS = /\A
    (?=.{8,}) #contains at least 8 char
    (?=.*\d) #contains at least 1 number
    (?=.*[A-Z]) #contains at least one uppercase letter
  /x

  validates :password, format: PASSWORD_REQUIREMENTS

  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end
  
end
