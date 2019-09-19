# frozen_string_literal: true

# main class
class CleanerCity < ApplicationRecord
  belongs_to :city
  belongs_to :cleaner
end
