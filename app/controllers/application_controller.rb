class ApplicationController < ActionController::Base
  protect_from_forgery
  set_current_tenant_through_filter
  before_filter :current_tenant, :set_locale

  def current_tenant
    unless request.subdomain.blank? || request.subdomain == "www"
      @current_account = Account.find_by_name(request.subdomain)
      if @current_account
        unless @current_account.name == "ccc"
          set_current_tenant(@current_account)
          Time.zone = @current_account.time_zone
        else
          set_current_tenant(nil)
        end
      else
        render "home/domain_error"
      end
    else
      set_current_tenant(nil)
    end
  end
  
  def after_sign_in_path_for(resource)
    if resource.status == User::STATUS_INACTIVE || resource.status == User::STATUS_BANNED
      flash[:notice] = nil
      flash[:error] = "That user is no longer active."
      sign_out(:user)
    end
    root_url(:subdomain => resource.account.name)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
