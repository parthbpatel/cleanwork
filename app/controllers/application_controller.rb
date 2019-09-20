# frozen_string_literal: true

# main class
class ApplicationController < ActionController::Base
  before_action :check_session, only: %i[edit update new show]

  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def check_session
    render 'sessions/new' if session[:customer_id].blank?
  end

  def logged_in_customer
    (return if logged_in?)
    store_location
    flash[:danger] = 'Please log in.'
    redirect_to login_path
  end
end
