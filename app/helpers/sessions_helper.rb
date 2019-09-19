module SessionsHelper

  # Logs in the given user.
  def log_in(customer)
    session[:customer_id] = customer.id
  end

  # Remembers a user in a persistent session.
  def remember(customer)
    customer.remember
    cookies.permanent.signed[:customer_id] = customer.id
    cookies.permanent[:remember_token] = customer.remember_token
  end

  # Returns the logged-in user (if any), version 2 for persistent cookies.
  def current_customer
    if (customer_id = session[:customer_id])
      @current_customer ||= Customer.find_by(id: customer_id)
    elsif (customer_id = cookies.signed[:customer_id])
      customer = Customer.find_by(id: customer_id)
      if customer && customer.authenticated?(:remember, cookies[:remember_token])
        log_in customer
        @current_customer = customer
      end
    end
  end

  def current_user?(customer)
    customer == current_customer
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_customer.nil?
  end

  # Forgets a persistent session.
  def forget(customer)
    customer.forget
    cookies.delete(:customer_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_customer)
    session.delete(:customer_id)
    @current_customer = nil
  end

  # Redirects to stored location (or to the default)
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get? # the request object is used here
    # puts the requested URL in the session variable under the key :forwarding_url but only for a GET request
  end
end
