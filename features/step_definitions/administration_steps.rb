Then /^I should see "(.*?)"$/ do |content|
  page.should have_content content
end

Given /^I have a product$/ do
  @product = @account.products.create(FactoryGirl.attributes_for(:product))
end


%w{dashboard products users}.each do |page|

  When /^I go to the #{page} page$/ do
    if page == "dashboard"
      visit "/administration/"
    else
      visit "/administration/#{page}"
    end
  end

end
