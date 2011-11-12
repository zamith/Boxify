class ItemsController < ApplicationController
  
  def new
    @box = Box.find params[:box_id]
    @warehouse = Warehouse.find params[:warehouse_id]
    @items = @box.items
    @item = Item.new
  end  
  
end
