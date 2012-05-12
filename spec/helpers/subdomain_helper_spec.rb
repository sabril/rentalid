require 'spec_helper'
include SubdomainHelper


describe SubdomainHelper do
  before(:each) do
    @subdomain = "ccc"
  end
  describe "with_subdomain" do
    it "should add subdomain to url" do
      with_subdomain(@subdomain).should == "#{@subdomain}.#{SITE_URL}"
    end
  end
  
  describe "url_for" do
    it "should give subdomain to resource" do
      options = {:controller => 'users', :subdomain => @subdomain}
      url_for(options).should == "/users"
    end
  end

end