class LineItem < ApplicationRecord
  belongs_to :product  #foreign key to the corresponding model
  belongs_to :cart

	def total_price 
  		product.price * quantity
  	end
end
