class Tutor < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_one_attached :avatar
end
