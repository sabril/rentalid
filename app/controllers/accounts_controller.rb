class AccountsController < ApplicationController
  layout 'new_account'
  def new
    @account = Account.new
    @account.users.build
  end
  
  def create
    @account = Account.new(params[:tenant])
    if @account.save
      redirect_to thank_you_path
    else
      render :new
    end
  end
end