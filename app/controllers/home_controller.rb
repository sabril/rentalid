class HomeController < ApplicationController
  def index
    @products = Product.order("RANDOM()").limit(8)
    @featured_product = Product.order("RANDOM()").first
  end
end
