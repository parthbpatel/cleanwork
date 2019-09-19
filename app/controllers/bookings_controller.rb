# frozen_string_literal: true

# booking class
class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_customer

  def index
    @customer = Customer.find(params[:customer_id])

    @bookings = @customer.bookings
    # @city = City.find(params[:city_id])
    # @bookings = @customer.bookings
    # @cleaner = Cleaner.find(params[:cleaner_id])
    # @cleaner  = Cleaner.find(params[:cleaner_id])
  end

  def show; end

  def new
    @booking = Booking.new
    @cleaners = Cleaner.all
  end

  def edit; end

  def create
    @booking = @customer.bookings.new(booking_params)
    # @customer = Customer.find(params[:customer_id])

    respond_to do |format|
      if @booking.save!
        format.html { redirect_to customer_bookings_path,
                                notice: 'Booking was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking,
                                notice: 'Booking was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url,
                              notice: 'Booking was successfully destroyed.' }
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:customer_id, :cleaner_id, :date)
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
end
