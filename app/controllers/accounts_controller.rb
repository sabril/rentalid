class AccountsController < ApplicationController
  def new
    @account = Account.new
    @account.users.build
  end
  
  def create
    @account = Account.new(params[:account])
    if @account.save
      @owner = @account.users.first
      @owner.roles = ["owner"]
      @owner.save
      redirect_to thank_you_path(:subdomain => @account.name)
    else
      render :new
    end
  end
end