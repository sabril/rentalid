class ApplicationController < ActionController::Base
  protect_from_forgery
  set_current_tenant_through_filter
  before_filter :current_tenant

  def current_tenant
    unless request.subdomain == "www"
      current_account = Account.find_by_name(request.subdomain)
      if current_account
        set_current_tenant(current_account)
      else
        render :template => 'home/domain_error'
      end
    end
  end
end
