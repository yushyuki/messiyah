class Customers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @customer = Customer.find_for_facebook_oauth(request.env["omniauth.auth"], current_customer)
 
    if @customer.persisted?
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      sign_in_and_redirect @customer, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_customer_registration_url
    end
  end
 
  def twitter
    # You need to implement the method below in your model
    @customer = Customer.find_for_twitter_oauth(request.env["omniauth.auth"], current_customer)
 
    if @customer.persisted?
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
      sign_in_and_redirect @customer, :event => :authentication
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_customer_registration_url
    end
  end
end