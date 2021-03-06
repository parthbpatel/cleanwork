# frozen_string_literal: true

# customer class
class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  def index
    current_customer = Customer.find_by_id(session[:current_customer_id])
    @customers = Customer.all
    @cities = City.all
    @booking = Booking.all
  end

  def show; end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html do
          redirect_to @customer,
                      notice: 'Customer was successfully created.'
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html do
          redirect_to @customer,
                      notice: 'Customer was successfully updated.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_url
    respond_to do |format|
      format.html do
        redirect_to @customer,
                    notice: 'Customer Destroyed.'
      end
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone_number)
  end
end
