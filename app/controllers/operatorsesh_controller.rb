class OperatorseshController < ApplicationController

  def new
  end

  def create
    operator = StoreOperator.find_by(user_name: params[:operatorsesh][:user_name])

    if authenticated?(operator)

      session[:operator_id] = operator.id
      flash[:good_message] =  "Welcome back #{operator.name}"
      redirect_to(admindashboard)
    else
      flash[:bad_message] = "Login Unsuccessful"
    end
  end

  private
  def authenticated?(operator)
    operator != nil && operator.authenticate(params[:operatorsesh][:password])
  end
end
