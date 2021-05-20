class Garage < ApplicationRecord
  extend FriendlyId
  friendly_id :license_plate, use: :slugged
  validates_uniqueness_of :license_plate
  belongs_to :user , optional: true
end
