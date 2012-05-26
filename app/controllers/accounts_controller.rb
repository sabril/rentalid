class AccountsController < ApplicationController
  before_filter :check_signed_in
  
  def new
    @account = Account.new
    @account.users.build
  end
  
  def create
    @account = Account.new(params[:account])
    if @account.save
      @account.create_owner
      redirect_to thank_you_url(:subdomain => @account.name)
    else
      render :new
    end
  end
  
  protected
  
  def check_signed_in
    if current_user
      redirect_to root_url(:subdomain => current_user.account.name)
    end
  end
  
  def no_subdomain
    if request.subdomain != "www"
      redirect_to new_account_url(:subdomain => "www")
    end
  end
end