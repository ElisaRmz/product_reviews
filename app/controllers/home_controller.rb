class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @products = pagy(Product.all)
  end
end
