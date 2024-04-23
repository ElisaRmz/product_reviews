class HomeController < ApplicationController
  before_action :authenticate_user!

  # TODO: Fix url errors
  # TODO: Show only uncommented products

  def index
    @products = Product.all
  end
end
