class Tutor < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_one_attached :avatar
  acts_as_taggable_on :subjects
end
