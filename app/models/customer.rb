# frozen_string_literal: true

# main class
class Customer < ApplicationRecord
  has_many :bookings
  # has_one :city
  has_and_belongs_to_many :cities, join_table: 'customers_cities'
  validates :phone_number, uniqueness: true, length: { minimum: 10 }
  validates :first_name, presence: true
  validates :last_name, presence: true
end
