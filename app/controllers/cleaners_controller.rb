# frozen_string_literal: true

# cleaner class
class CleanersController < ApplicationController
  before_action :set_cleaner, only: %i[show edit update destroy]

  def index
    @cleaners = Cleaner.all
    @cities = City.all
  end

  def show
    @cleaner = Cleaner.find(params[:id])
    @bookings = @cleaner.bookings
  end

  def new
    @cleaner = Cleaner.new
  end

  def edit; end

  def create
    @cleaner = Cleaner.new(cleaner_params)
    @bookings = Booking.all

    respond_to do |format|
      if @cleaner.save
        format.html { redirect_to @cleaner,
                                notice: 'Cleaner was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @cleaner.update(cleaner_params)
        format.html { redirect_to @cleaner,
                                notice: 'Cleaner was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @cleaner.destroy
    respond_to do |format|
      format.html { redirect_to cleaners_url,
                              notice: 'Cleaner was successfully destroyed.' }
    end
  end

  private

  def set_cleaner
    @cleaner = Cleaner.find(params[:id])
  end

  def cleaner_params
    params.require(:cleaner).permit(:first_name, :last_name,
                                    :quality_score, :phone_number, city_ids: [])
  end
end
