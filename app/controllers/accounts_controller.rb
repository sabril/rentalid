class AccountsController < ApplicationController
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
end