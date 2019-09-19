# frozen_string_literal: true

# cityclass
class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    @city.save
    redirect_to new_city_path
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end
end
