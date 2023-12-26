class CustomersController < ApplicationController

  def create
    @customer = Customer.create(customer_params)

    if @customer.save
      render json: @customer, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def login
    @customer = Customer.find_by_email(params[:customer][:email])

    if @customer && @customer.authenticate(params[:customer][:password])
      session[:customer_id] = @customer.id
      render json: @customer
    else
      render json: {error: 'Invalid credentials email or password'}, status: :unauthorized
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation)
  end
end