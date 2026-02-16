class Profile < ApplicationRecord
  belongs_to :user
  validates :bio, presence: true
  delegate :name, to: :user #
end
