class WarehousesController < ApplicationController
  
  def index
    @warehouses = current_user.warehouses
  end  
  
  def new
    @warehouse = Warehouse.new
  end  
  
end
