# frozen_string_literal: true

# main class
class Cleaner < ApplicationRecord
  has_many :bookings
  has_and_belongs_to_many :cities, join_table: 'cities_cleaners'
  validates :phone_number, uniqueness: true, length: { minimum: 10 }
  validates :first_name, presence: true
  validates :last_name, presence: true
end
