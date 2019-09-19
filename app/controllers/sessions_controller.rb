# frozen_string_literal: true

# session class
class SessionsController < ApplicationController
  def new; end

  def create
    @customer = Customer.find_by(phone_number: params[:session][:phone_number])
    if @customer.present?
      redirect_to customer_path(id: @customer.id)
    else
      flash[:danger] = 'Invalid Phone Number'
      redirect_to root_path
    end
  end

  def destroy
    redirect_to root_path
  end
end
