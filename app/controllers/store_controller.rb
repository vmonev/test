class StoreController < ApplicationController
	include CurrentCart # controllers/concerns/current_cart.rb
	before_action :set_cart
  def index
  	# order() -- alphabetical order
  	@products = Product.order(:title)
  end
end
