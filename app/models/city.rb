# frozen_string_literal: true

# main class
class City < ApplicationRecord
  has_and_belongs_to_many :cleaners, join_table: 'cities_cleaners'
end
