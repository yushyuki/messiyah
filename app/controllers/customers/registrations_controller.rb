class Customers::RegistrationsController < Devise::RegistrationsController
before_action :authenticate_customer!, only: [:edit, :update]
before_action :current_customer,   only: [:edit, :update]
  def create
    @customer = Customer.new(customer_params)
    file = params[:customer][:image]
    @customer.set_image(file)
    if @customer.save
      sign_in @customer
      flash[:success] = "Welcome to Twitter!"
      redirect_to root_path
    else
      render 'customers/registrations/new'
    end
  end

  def update
    file = params[:customer][:image]
    @customer.set_image(file)
    if @customer.update_attributes(customer_params)
      flash[:success] = "Profile updated"
      sign_in(@customer, :bypass => true)
      redirect_to root_path
    else
      render 'customers/registrations/edit'
    end
  end
  
  def build_resource(hash=nil)
    hash[:uid] = Customer.create_unique_string
    super
  end
  private

  def customer_params
      params.require(:customer).permit(:name, :email, :image, :password, :password_confirmation)
  end

  def set_customer
      @customer = Customer.find(params[:id])
    end
end