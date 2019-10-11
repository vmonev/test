class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy

	def add_product(product_id)
		current_item = line_items.find_by(product_id: product_id) 
		if current_item  #if != nil
    		current_item.quantity += 1
		else
    		current_item = line_items.build(product_id: product_id)
		end
  		current_item
	end

	def total_price
		line_items.to_a.sum { |item| item.total_price }
		#using Rails Array::sum() method to sum the prices of each item in the collection.
	end
end


#The dependent: :destroy part indicates that the 
#existence of line items is dependent on the existence 
#of the cart. If we destroy a cart, deleting it from 
#the database, we’ll want Rails also to destroy any 
#line items that are associated with that cart.

