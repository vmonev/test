class AddOrderToLineItem < ActiveRecord::Migration[6.0]
  def self.up    
    #add_column :line_items, :order_id, :integer
    #change_column :line_items, :order_id, :integer, :null => false, :options => "CONSTRAINT fk_line_items_order REFERENCES orders(id)"
    add_reference :line_items, :order, foreign_key: true  #add line_items(order_id) REF orders(id)  #dont use null=>flase 
    #after adding a col use this:
    #change_column_null :line_items, :order_id, false
  end

  def self.down
    remove_column :line_items, :order_id, :integer   
  end
end
