class Animal < ApplicationRecord
  has_many :sightings

  accepts_nested_attributes_for :sightings

  validates :common_name, :latin_name, presence: true, uniqueness: true 
  validates :kingdom, presence: true
end
