class AccountsController < ApplicationController
  def new
    @account = Account.new
    @account.users.build
  end
  
  def create
    @account = Account.new(params[:account])
    if @account.save
      @account.owner_id = @account.users.first[:id]
      @account.save
      @owner = @account.owner
      @owner.roles = ["owner"]
      @owner.save
      redirect_to thank_you_path(:subdomain => @account.name)
    else
      render :new
    end
  end
end