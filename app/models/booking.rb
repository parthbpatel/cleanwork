# frozen_string_literal: true

# main class
class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :cleaner
end
