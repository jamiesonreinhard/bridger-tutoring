class User < ApplicationRecord
  has_secure_password

  enum role: [:student, :tutor, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end
  
end
