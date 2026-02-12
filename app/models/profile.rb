class Profile < ApplicationRecord
  belongs_to :user
  validates :bio
end
